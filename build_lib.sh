#!/bin/sh

# We have to ensure the bilsv directory exist before running make
mkdir -p src/bsp/platform/bilsv

# cp ../bilsv3-libraries/internal/iotc_bsp/* src/bsp/platform/bilsv/

cp ../bilsv3-libraries/internal/iotc_bsp/iotc_bsp_rng_crypto.c src/bsp/platform/bilsv/iotc_bsp_rng_crypto_bilsv.c
cp ../bilsv3-libraries/internal/iotc_bsp/iotc_bsp_time.c src/bsp/platform/bilsv/iotc_bsp_time_bilsv.c
cp ../bilsv3-libraries/internal/iotc_bsp/iotc_bsp_io_net.c src/bsp/platform/bilsv/iotc_bsp_io_net_bilsv.c
cp ../bilsv3-libraries/internal/iotc_bsp/iotc_bsp_mem.c src/bsp/platform/bilsv/iotc_bsp_mem_bilsv.c

# cp ../bilsv3-libraries/internal/iotc_bsp/iotc_bsp_mem_freertos.c src/bsp/platform/bilsv/iotc_bsp_mem_free_rtos_bilsv.c
if [ $# -eq 0 ]; then
    echo "Missing second arguement, [del] for developement or [rel] for release"
    exit;
fi

if [ "$1" = "del" ]; then
    make PRESET=BILSV3_DEL
fi

if [ "$1" = "rel" ]; then
    make PRESET=BILSV3_REL
fi
