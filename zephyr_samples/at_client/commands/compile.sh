#!/bin/bash

MY_DIR=$(dirname $0)
BASE_DIR=${MY_DIR}/..

touch ${BASE_DIR}/at_client.cpp
cd ${BASE_DIR}/build
OBJ_FILE=${BASE_DIR}/build/CMakeFiles/app.dir/at_client.cpp.obj


# Original command from compile_commands.json
# #C:\\ncs\\toolchains\\c57af46cb7\\opt\\zephyr-sdk\\arm-zephyr-eabi\\bin\\arm-zephyr-eabi-g++.exe \
# 	-DKERNEL \
# 	-DMBEDTLS_CONFIG_FILE=\\\"nrf-config.h\\\" \
# 	-DMBEDTLS_USER_CONFIG_FILE=\\\"nrf-config-user.h\\\" \
# 	-DNRF9160_XXAA \
# 	-DNRF_SKIP_FICR_NS_COPY_TO_RAM \
# 	-DNRF_TRUSTZONE_NONSECURE \
# 	-DPICOLIBC_DOUBLE_PRINTF_SCANF \
# 	-DTFM_PSA_API \
# 	-DUSE_PARTITION_MANAGER=1 \
# 	-D_FORTIFY_SOURCE=1 \
# 	-D_POSIX_C_SOURCE=200809 \
# 	-D__LINUX_ERRNO_EXTENSIONS__ \
# 	-D__PROGRAM_START \
# 	-D__ZEPHYR__=1 \
# 	-IC:/ncs/v2.5.0/zephyr/include \
# 	-IC:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/zephyr/include/generated \
# 	-IC:/ncs/v2.5.0/zephyr/soc/arm/nordic_nrf/nrf91 \
# 	-IC:/ncs/v2.5.0/zephyr/soc/arm/nordic_nrf/common/. \
# 	-IC:/ncs/v2.5.0/zephyr/subsys/net/lib/sockets/. \
# 	-IC:/ncs/v2.5.0/nrf/include \
# 	-IC:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/tfm/install/interface/include \
# 	-IC:/ncs/v2.5.0/nrf/include/tfm \
# 	-IC:/ncs/v2.5.0/nrf/tests/include \
# 	-IC:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/tfm/generated/interface/include \
# 	-IC:/ncs/v2.5.0/modules/hal/cmsis/CMSIS/Core/Include \
# 	-IC:/ncs/v2.5.0/zephyr/modules/cmsis/. \
# 	-IC:/ncs/v2.5.0/modules/hal/nordic/nrfx \
# 	-IC:/ncs/v2.5.0/modules/hal/nordic/nrfx/drivers/include \
# 	-IC:/ncs/v2.5.0/modules/hal/nordic/nrfx/mdk \
# 	-IC:/ncs/v2.5.0/zephyr/modules/hal_nordic/nrfx/. \
# 	-IC:/ncs/v2.5.0/modules/lib/Arduino-Zephyr-API/cores/arduino/. \
# 	-IC:/ncs/v2.5.0/modules/lib/Arduino-Zephyr-API/cores/arduino/../../variants \
# 	-IC:/ncs/v2.5.0/modules/lib/Arduino-Zephyr-API/variants/. \
# 	-IC:/ncs/v2.5.0/modules/lib/Arduino-Zephyr-API/variants/nrf9160dk_nrf9160_ns \
# 	-IC:/ncs/v2.5.0/modules/lib/Arduino-Zephyr-API/libraries/Wire/. \
# 	-IC:/ncs/v2.5.0/nrfxlib/nrf_modem/include \
# 	-IC:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/modules/nrf/subsys/nrf_security/src/include/generated \
# 	-IC:/ncs/v2.5.0/nrf/subsys/nrf_security/include \
# 	-IC:/ncs/v2.5.0/nrf/ext/oberon/psa/core/include \
# 	-IC:/ncs/v2.5.0/nrf/ext/oberon/psa/core/library \
# 	-IC:/ncs/v2.5.0/modules/crypto/mbedtls/include \
# 	-IC:/ncs/v2.5.0/modules/crypto/mbedtls/library \
# 	-IC:/ncs/v2.5.0/nrfxlib/crypto/nrf_oberon/include/mbedtls \
# 	-IC:/ncs/v2.5.0/nrfxlib/crypto/nrf_oberon/include \
# 	-isystem C:/ncs/v2.5.0/zephyr/lib/cpp/minimal/include \
# 	-fno-strict-aliasing \
# 	-Os \
# 	-fcheck-new \
# 	-std=c++11 \
# 	-fno-exceptions \
# 	-fno-rtti \
# 	-imacros C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/zephyr/include/generated/autoconf.h \
# 	-fno-common \
# 	-g \
# 	-gdwarf-4 \
# 	-fdiagnostics-color=always \
# 	-mcpu=cortex-m33 \
# 	-mthumb \
# 	-mabi=aapcs \
# 	-mfp16-format=ieee \
# 	--sysroot=C:/ncs/toolchains/c57af46cb7/opt/zephyr-sdk/arm-zephyr-eabi/arm-zephyr-eabi \
# 	-imacros C:/ncs/v2.5.0/zephyr/include/zephyr/toolchain/zephyr_stdint.h \
# 	-Wall \
# 	-Wformat \
# 	-Wformat-security \
# 	-Wno-format-zero-length \
# 	-Wpointer-arith \
# 	-Wexpansion-to-defined \
# 	-Wno-unused-but-set-variable \
# 	-fno-pic \
# 	-fno-pie \
# 	-fno-asynchronous-unwind-tables \
# 	-ftls-model=local-exec \
# 	-fno-reorder-functions \
# 	--param=min-pagesize=0 \
# 	-fno-defer-pop \
# 	-fmacro-prefix-map=C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client=CMAKE_SOURCE_DIR \
# 	-fmacro-prefix-map=C:/ncs/v2.5.0/zephyr=ZEPHYR_BASE \
# 	-fmacro-prefix-map=C:/ncs/v2.5.0=WEST_TOPDIR \
# 	-ffunction-sections \
# 	-fdata-sections \
# 	--specs=picolibc.specs \
# 	-nostdinc++ \
# 	-o CMakeFiles\\app.dir\\at_client.cpp.obj \
# 	-c C:\\Users\\Dejan\\Documents\\Dev\\bosl\\BoslArduinoPackage\\zephyr_samples\\at_client\\at_client.cpp

rm -f ${OBJ_FILE}
# verbatim copy of the original command
C:/ncs/toolchains/c57af46cb7/opt/zephyr-sdk/arm-zephyr-eabi/bin/arm-zephyr-eabi-g++.exe \
	-DKERNEL \
	-DMBEDTLS_CONFIG_FILE=//"nrf-config.h//" \
	-DMBEDTLS_USER_CONFIG_FILE=//"nrf-config-user.h//" \
	-DNRF9160_XXAA \
	-DNRF_SKIP_FICR_NS_COPY_TO_RAM \
	-DNRF_TRUSTZONE_NONSECURE \
	-DPICOLIBC_DOUBLE_PRINTF_SCANF \
	-DTFM_PSA_API \
	-DUSE_PARTITION_MANAGER=1 \
	-D_FORTIFY_SOURCE=1 \
	-D_POSIX_C_SOURCE=200809 \
	-D__LINUX_ERRNO_EXTENSIONS__ \
	-D__PROGRAM_START \
	-D__ZEPHYR__=1 \
	-IC:/ncs/v2.5.0/zephyr/include \
	-IC:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/zephyr/include/generated \
	-IC:/ncs/v2.5.0/zephyr/soc/arm/nordic_nrf/nrf91 \
	-IC:/ncs/v2.5.0/zephyr/soc/arm/nordic_nrf/common/. \
	-IC:/ncs/v2.5.0/zephyr/subsys/net/lib/sockets/. \
	-IC:/ncs/v2.5.0/nrf/include \
	-IC:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/tfm/install/interface/include \
	-IC:/ncs/v2.5.0/nrf/include/tfm \
	-IC:/ncs/v2.5.0/nrf/tests/include \
	-IC:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/tfm/generated/interface/include \
	-IC:/ncs/v2.5.0/modules/hal/cmsis/CMSIS/Core/Include \
	-IC:/ncs/v2.5.0/zephyr/modules/cmsis/. \
	-IC:/ncs/v2.5.0/modules/hal/nordic/nrfx \
	-IC:/ncs/v2.5.0/modules/hal/nordic/nrfx/drivers/include \
	-IC:/ncs/v2.5.0/modules/hal/nordic/nrfx/mdk \
	-IC:/ncs/v2.5.0/zephyr/modules/hal_nordic/nrfx/. \
	-IC:/ncs/v2.5.0/modules/lib/Arduino-Zephyr-API/cores/arduino/. \
	-IC:/ncs/v2.5.0/modules/lib/Arduino-Zephyr-API/cores/arduino/../../variants \
	-IC:/ncs/v2.5.0/modules/lib/Arduino-Zephyr-API/variants/. \
	-IC:/ncs/v2.5.0/modules/lib/Arduino-Zephyr-API/variants/nrf9160dk_nrf9160_ns \
	-IC:/ncs/v2.5.0/modules/lib/Arduino-Zephyr-API/libraries/Wire/. \
	-IC:/ncs/v2.5.0/nrfxlib/nrf_modem/include \
	-IC:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/modules/nrf/subsys/nrf_security/src/include/generated \
	-IC:/ncs/v2.5.0/nrf/subsys/nrf_security/include \
	-IC:/ncs/v2.5.0/nrf/ext/oberon/psa/core/include \
	-IC:/ncs/v2.5.0/nrf/ext/oberon/psa/core/library \
	-IC:/ncs/v2.5.0/modules/crypto/mbedtls/include \
	-IC:/ncs/v2.5.0/modules/crypto/mbedtls/library \
	-IC:/ncs/v2.5.0/nrfxlib/crypto/nrf_oberon/include/mbedtls \
	-IC:/ncs/v2.5.0/nrfxlib/crypto/nrf_oberon/include \
	-isystem C:/ncs/v2.5.0/zephyr/lib/cpp/minimal/include \
	-fno-strict-aliasing \
	-Os \
	-fcheck-new \
	-std=c++11 \
	-fno-exceptions \
	-fno-rtti \
	-imacros C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/zephyr/include/generated/autoconf.h \
	-fno-common \
	-g \
	-gdwarf-4 \
	-fdiagnostics-color=always \
	-mcpu=cortex-m33 \
	-mthumb \
	-mabi=aapcs \
	-mfp16-format=ieee \
	--sysroot=C:/ncs/toolchains/c57af46cb7/opt/zephyr-sdk/arm-zephyr-eabi/arm-zephyr-eabi \
	-imacros C:/ncs/v2.5.0/zephyr/include/zephyr/toolchain/zephyr_stdint.h \
	-Wall \
	-Wformat \
	-Wformat-security \
	-Wno-format-zero-length \
	-Wpointer-arith \
	-Wexpansion-to-defined \
	-Wno-unused-but-set-variable \
	-fno-pic \
	-fno-pie \
	-fno-asynchronous-unwind-tables \
	-ftls-model=local-exec \
	-fno-reorder-functions \
	--param=min-pagesize=0 \
	-fno-defer-pop \
	-fmacro-prefix-map=C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client=CMAKE_SOURCE_DIR \
	-fmacro-prefix-map=C:/ncs/v2.5.0/zephyr=ZEPHYR_BASE \
	-fmacro-prefix-map=C:/ncs/v2.5.0=WEST_TOPDIR \
	-ffunction-sections \
	-fdata-sections \
	--specs=picolibc.specs \
	-nostdinc++ \
	-o CMakeFiles/app.dir/at_client.cpp.obj \
	-c ${BASE_DIR}/at_client.cpp
md5sum ${OBJ_FILE}

rm -f ${OBJ_FILE}
# my simplification
NRF_PATH=C:/ncs/v2.5.0/nrf		#${NRF_SDK_PATH}/nrf
NRFXLIB_PATH=C:/ncs/v2.5.0/nrfxlib
NRF_MODULES_PATH=C:/ncs/v2.5.0/modules
SAMPLE_DIR=${BASE_DIR}

COMPILER_DEFINES=\

C:/ncs/toolchains/c57af46cb7/opt/zephyr-sdk/arm-zephyr-eabi/bin/arm-zephyr-eabi-g++.exe \
	-DKERNEL \
	-DNRF9160_XXAA \
	-DNRF_SKIP_FICR_NS_COPY_TO_RAM \
	-DNRF_TRUSTZONE_NONSECURE \
	-DPICOLIBC_DOUBLE_PRINTF_SCANF \
	-DTFM_PSA_API \
	-DUSE_PARTITION_MANAGER=1 \
	-D_FORTIFY_SOURCE=1 \
	-D_POSIX_C_SOURCE=200809 \
	-D__LINUX_ERRNO_EXTENSIONS__ \
	-D__PROGRAM_START \
	-D__ZEPHYR__=1 \
	-I${SAMPLE_DIR}/build/modules/nrf/subsys/nrf_security/src/include/generated \
	-I${SAMPLE_DIR}/build/tfm/generated/interface/include \
	-I${SAMPLE_DIR}/build/zephyr/include/generated \
	-I${NRF_PATH}/include \
	-I${NRF_PATH}/include/tfm \
	-I${NRF_PATH}/subsys/nrf_security/include \
	-I${NRFXLIB_PATH}/nrf_modem/include \
	-I${NRF_MODULES_PATH}/hal/cmsis/CMSIS/Core/Include \
	-I${NRF_MODULES_PATH}/hal/nordic/nrfx \
	-I${NRF_MODULES_PATH}/hal/nordic/nrfx/drivers/include \
	-I${NRF_MODULES_PATH}/hal/nordic/nrfx/mdk \
	-I${NRF_MODULES_PATH}/lib/Arduino-Zephyr-API/cores/arduino/. \
	-I${NRF_MODULES_PATH}/lib/Arduino-Zephyr-API/cores/arduino/../../variants \
	-I${NRF_MODULES_PATH}/lib/Arduino-Zephyr-API/variants/. \
	-I${NRF_MODULES_PATH}/lib/Arduino-Zephyr-API/variants/nrf9160dk_nrf9160 \
	-I${NRF_MODULES_PATH}/lib/Arduino-Zephyr-API/variants/nrf9160dk_nrf9160_ns \
	-I${NRF_MODULES_PATH}/lib/Arduino-Zephyr-API/libraries/Wire/. \
	-I${SAMPLE_DIR}/build/tfm/install/interface/include \
	-I${ZEPHYR_BASE}/include \
	-I${ZEPHYR_BASE}/modules/cmsis/. \
	-I${ZEPHYR_BASE}/modules/hal_nordic/nrfx/. \
	-I${ZEPHYR_BASE}/soc/arm/nordic_nrf/nrf91 \
	-I${ZEPHYR_BASE}/soc/arm/nordic_nrf/common/. \
	-I${ZEPHYR_BASE}/subsys/net/lib/sockets/. \
	-isystem ${ZEPHYR_BASE}/lib/cpp/minimal/include \
	-imacros ${SAMPLE_DIR}/build/zephyr/include/generated/autoconf.h \
	-imacros ${ZEPHYR_BASE}/include/zephyr/toolchain/zephyr_stdint.h \
	--sysroot=C:/ncs/toolchains/c57af46cb7/opt/zephyr-sdk/arm-zephyr-eabi/arm-zephyr-eabi \
	-fno-strict-aliasing \
	-Os \
	-fcheck-new \
	-std=c++11 \
	-fno-exceptions \
	-fno-rtti \
	-fno-common \
	-g \
	-gdwarf-4 \
	-fdiagnostics-color=always \
	-mcpu=cortex-m33 \
	-mthumb \
	-mabi=aapcs \
	-mfp16-format=ieee \
	-Wall \
	-Wformat \
	-Wformat-security \
	-Wno-format-zero-length \
	-Wpointer-arith \
	-Wexpansion-to-defined \
	-Wno-unused-but-set-variable \
	-fno-pic \
	-fno-pie \
	-fno-asynchronous-unwind-tables \
	-ftls-model=local-exec \
	-fno-reorder-functions \
	--param=min-pagesize=0 \
	-fno-defer-pop \
	-ffunction-sections \
	-fdata-sections \
	--specs=picolibc.specs \
	-nostdinc++ \
	-o CMakeFiles/app.dir/at_client.cpp.obj \
	-c ${SAMPLE_DIR}/at_client.cpp
# Removed options
#	-DMBEDTLS_CONFIG_FILE=//"nrf-config.h//" \
#	-DMBEDTLS_USER_CONFIG_FILE=//"nrf-config-user.h//" \
#	-I${NRF_PATH}/tests/include \
#	-IC:/ncs/v2.5.0/modules/crypto/mbedtls/include \
#	-IC:/ncs/v2.5.0/modules/crypto/mbedtls/library \
#	-I${NRF_PATH}/ext/oberon/psa/core/include \
#	-I${NRF_PATH}/ext/oberon/psa/core/library \
#	-I${NRF_PATH}xlib/crypto/nrf_oberon/include/mbedtls \
#	-I${NRF_PATH}xlib/crypto/nrf_oberon/include \
#	-fmacro-prefix-map=${SAMPLE_DIR}=CMAKE_SOURCE_DIR \
#	-fmacro-prefix-map=${ZEPHYR_BASE}=ZEPHYR_BASE \
#	-fmacro-prefix-map=C:/ncs/v2.5.0=WEST_TOPDIR \
md5sum ${OBJ_FILE}

#ninja && md5sum zephyr/merged.hex


