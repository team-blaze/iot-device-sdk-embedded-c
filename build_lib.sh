#!/bin/sh

print_help_exit() {
    echo "Usage: "$0" debug|release [rtos||bare]"
    echo "[debug] to build for debug or [release] for release"
    echo "[rtos] or [] to build for FreeRTOS or [bare] for baremetal"
    exit
}

copy_all_files() {
    cp ../bilsv3-libraries/internal/iotc_bsp/iotc_bsp_rng_crypto.c src/bsp/platform/bilsv/iotc_bsp_rng_crypto_bilsv.c
    cp ../bilsv3-libraries/internal/iotc_bsp/iotc_bsp_time.c src/bsp/platform/bilsv/iotc_bsp_time_bilsv.c
    cp ../bilsv3-libraries/internal/iotc_bsp/iotc_bsp_io_net.c src/bsp/platform/bilsv/iotc_bsp_io_net_bilsv.c
    cp ../bilsv3-libraries/internal/iotc_bsp/iotc_bsp_mem.c src/bsp/platform/bilsv/iotc_bsp_mem_bilsv.c
}

copy_freertos_files() {
    # will overwrite the previous copied files
    cp ../bilsv3-libraries/internal/iotc_bsp/iotc_bsp_mem_freertos.c src/bsp/platform/bilsv/iotc_bsp_mem_bilsv.c
    cp ../bilsv3-libraries/internal/iotc_bsp/iotc_bsp_io_net_freertos.c src/bsp/platform/bilsv/iotc_bsp_io_net_bilsv.c
}

# Wipe the folder clean to avoid clashing FreeRTOS with non-FreeRTOS c files from previous run
rm -rf src/bsp/platform/bilsv
# We have to ensure the bilsv directory exist before running make
mkdir -p src/bsp/platform/bilsv

# Accept 1 to 2 arguments
if [ $# -lt 1 ] || [  $# -gt 2 ]; then
    print_help_exit
fi

copy_all_files

# if RTOS support is required, copy the correct files and set flag for makefile
if [ $# -eq 1 ]; then
    copy_freertos_files
elif [ "$2" = "rtos" ]; then
    copy_freertos_files
elif [ "$2" = "bare" ]; then
    # do nothing
    :
else
    echo invaid argument 2
    print_help_exit
fi

if [ "$1" = "debug" ]; then
    make PRESET=BILSV3_DEL
elif [ "$1" = "release" ]; then
    make PRESET=BILSV3_REL
elif [ "$1" = "clean" ]; then
    make PRESET=BILSV3_DEL clean
else
    echo invalid argument 1
    print_help_exit
fi
