include make/mt-os/mt-os-common.mk

CC = arm-none-eabi-gcc
AR = arm-none-eabi-ar

IOTC_FREERTOS_DIR_PATH=$(LIBIOTC)/../../bike.cydsn/Generated_Source/PSoC6/pdl/rtos/FreeRTOS/10.0.1/

IOTC_FREERTOS_DIR_INCLUDES = -I$(IOTC_FREERTOS_DIR_PATH)/Source/include/
IOTC_FREERTOS_DIR_INCLUDES += -I$(IOTC_FREERTOS_DIR_PATH)/Source/portable/GCC/CM4F/

MY_BUILD_PROJECT_PATH=$(LIBIOTC)/../../bike.cydsn
CRYPTO_AUTH_LIB_PATH=$(LIBIOTC)/third_party/cryptoauthlib/lib
INTERNAL_LIB_PATH=$(LIBIOTC)/../bilsv3-libraries/internal

#build positional independent code for the library
IOTC_COMMON_COMPILER_FLAGS += -mcpu=cortex-m4 -mthumb -mfloat-abi=softfp -mfpu=fpv4-sp-d16

IOTC_COMMON_COMPILER_FLAGS += -D CYBLE_416045_02 $(IOTC_FREERTOS_DIR_INCLUDES) -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6/pdl/ -I$(MY_BUILD_PROJECT_PATH)/ -I$(CRYPTO_AUTH_LIB_PATH)/ -I$(INTERNAL_LIB_PATH)/se -I$(INTERNAL_LIB_PATH)/gsm -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6/pdl/drivers/peripheral/crypto/ -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6/pdl/drivers/peripheral/rtc -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6/pdl/drivers/peripheral/mcwdt -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6/pdl/devices/psoc6/ip/ -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6/pdl/devices/psoc6/psoc63/include/ -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6 -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6/pdl/cmsis/include/ -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6/pdl/devices/psoc6/include/ -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6/pdl/devices/psoc6/include/ip/ -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6/pdl/drivers/peripheral/ -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6/pdl/drivers/peripheral/device/ -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6/pdl/drivers/peripheral/efuse/ -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6/pdl/drivers/peripheral/flash/ -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6/pdl/drivers/peripheral/gpio/ -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6/pdl/drivers/peripheral/ipc/ -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6/pdl/drivers/peripheral/lvd/ -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6/pdl/drivers/peripheral/profile/ -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6/pdl/drivers/peripheral/prot/ -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6/pdl/drivers/peripheral/scb/ -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6/pdl/drivers/peripheral/sysanalog/ -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6/pdl/drivers/peripheral/sysclk/ -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6/pdl/drivers/peripheral/sysint/ -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6/pdl/drivers/peripheral/syslib/ -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6/pdl/drivers/peripheral/syspm/ -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6/pdl/drivers/peripheral/systick/ -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6/pdl/drivers/peripheral/tcpwm/ -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6/pdl/drivers/peripheral/trigmux/ -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6/pdl/drivers/peripheral/wdt/ -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6/pdl/middleware/ -I$(MY_BUILD_PROJECT_PATH)/Generated_Source/PSoC6/pdl/utilities/

IOTC_ARFLAGS += -rs -c $(XI)
