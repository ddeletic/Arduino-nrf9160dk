#!/bin/bash

set -e

MY_DIR=$(realpath $(dirname $0))
BASE_DIR=${MY_DIR}/..

PY_SCRIPTS_PATH=C:/ncs/v2.5.0/zephyr/scripts/build
TOOLCHAIN_BIN_PATH=C:/ncs/toolchains/c57af46cb7/opt/zephyr-sdk/arm-zephyr-eabi/bin
ISR_TABLES_C_OBJ=zephyr/CMakeFiles/zephyr_final.dir/isr_tables.c.obj
ARCHIVE_PATH=zephyr/libbosl.a

touch ${BASE_DIR}/at_client.cpp
cd ${BASE_DIR}

rm -f ${BASE_DIR}/build/zephyr/merged.hex
rm -f ${BASE_DIR}/build/zephyr/zephyr.hex


#-------------------------------------------------------------------------------
if [ ! -f build/${ARCHIVE_PATH} ]; then
	echo Step [Archive] - libbosl.a
	cd build
	${TOOLCHAIN_BIN_PATH}/arm-zephyr-eabi-ar.exe \
		q ${ARCHIVE_PATH} \
			zephyr/CMakeFiles/zephyr_final.dir/misc/empty_file.c.obj \
			zephyr/CMakeFiles/offsets.dir/./arch/arm/core/offsets/offsets.c.obj \
			tfm/secure_fw/s_veneers.o \
			zephyr/libzephyr.a \
			zephyr/arch/common/libarch__common.a \
			zephyr/arch/arch/arm/core/aarch32/libarch__arm__core__aarch32.a \
			zephyr/arch/arch/arm/core/aarch32/cortex_m/libarch__arm__core__aarch32__cortex_m.a \
			zephyr/arch/arch/arm/core/aarch32/cortex_m/cmse/libarch__arm__core__aarch32__cortex_m__cmse.a \
			zephyr/arch/arch/arm/core/aarch32/mpu/libarch__arm__core__aarch32__mpu.a \
			zephyr/lib/libc/picolibc/liblib__libc__picolibc.a \
			zephyr/lib/libc/common/liblib__libc__common.a \
			zephyr/soc/soc/arm/common/cortex_m/libsoc__arm__common__cortex_m.a \
			zephyr/boards/arm/nrf9160dk_nrf9160/libboards__arm__nrf9160dk_nrf9160.a \
			zephyr/subsys/random/libsubsys__random.a \
			zephyr/subsys/net/libsubsys__net.a \
			zephyr/subsys/net/l2/offloaded_netdev/libsubsys__net__l2__offloaded_netdev.a \
			zephyr/subsys/net/ip/libsubsys__net__ip.a \
			zephyr/drivers/adc/libdrivers__adc.a \
			zephyr/drivers/clock_control/libdrivers__clock_control.a \
			zephyr/drivers/console/libdrivers__console.a \
			zephyr/drivers/entropy/libdrivers__entropy.a \
			zephyr/drivers/gpio/libdrivers__gpio.a \
			zephyr/drivers/i2c/libdrivers__i2c.a \
			zephyr/drivers/pinctrl/libdrivers__pinctrl.a \
			zephyr/drivers/serial/libdrivers__serial.a \
			zephyr/drivers/timer/libdrivers__timer.a \
			modules/nrf/lib/nrf_modem_lib/lib..__nrf__lib__nrf_modem_lib.a \
			modules/nrf/lib/at_monitor/lib..__nrf__lib__at_monitor.a \
			modules/nrf/lib/at_host/lib..__nrf__lib__at_host.a \
			modules/nrf/lib/fatal_error/lib..__nrf__lib__fatal_error.a \
			modules/nrf/lib/modem_antenna/lib..__nrf__lib__modem_antenna.a \
			modules/nrf/modules/tfm/zephyr/libtfm_api_nrf.a \
			modules/trusted-firmware-m/libtfm_api.a \
			modules/hal_nordic/nrfx/libmodules__hal_nordic__nrfx.a \
			C:/ncs/v2.5.0/nrfxlib/nrf_modem/lib/nRF9160/soft-float/libmodem.a \
			zephyr/kernel/libkernel.a \
			zephyr/arch/common/libisr_tables.a 
	md5sum ${ARCHIVE_PATH}
	cd - > /dev/null
fi

#-------------------------------------------------------------------------------
if [ ! -f build/bosl/libkernel.a ]; then
	echo Step [Unpack] - unpack libbosl.a
	rm -rf build/bosl
	mkdir -p build/bosl
	cd build/bosl
	cp ../zephyr/libbosl.a .
	${TOOLCHAIN_BIN_PATH}/arm-zephyr-eabi-ar.exe \
		x libbosl.a
	cd - > /dev/null
fi



#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------

OBJECTS="\
	bosl/empty_file.c.obj \
	bosl/offsets.c.obj \
	bosl/s_veneers.o \
"
WHOLE_LIBS="\
	bosl/libzephyr.a \
	bosl/libarch__common.a \
	bosl/libarch__arm__core__aarch32.a \
	bosl/libarch__arm__core__aarch32__cortex_m.a \
	bosl/libarch__arm__core__aarch32__cortex_m__cmse.a \
	bosl/libarch__arm__core__aarch32__mpu.a \
	bosl/liblib__libc__picolibc.a \
	bosl/liblib__libc__common.a \
	bosl/libsoc__arm__common__cortex_m.a \
	bosl/libboards__arm__nrf9160dk_nrf9160.a \
	bosl/libsubsys__random.a \
	bosl/libsubsys__net.a \
	bosl/libsubsys__net__l2__offloaded_netdev.a \
	bosl/libsubsys__net__ip.a \
	bosl/libdrivers__adc.a \
	bosl/libdrivers__clock_control.a \
	bosl/libdrivers__console.a \
	bosl/libdrivers__entropy.a \
	bosl/libdrivers__gpio.a \
	bosl/libdrivers__i2c.a \
	bosl/libdrivers__pinctrl.a \
	bosl/libdrivers__serial.a \
	bosl/libdrivers__timer.a \
	bosl/lib..__nrf__lib__nrf_modem_lib.a \
	bosl/lib..__nrf__lib__at_monitor.a \
	bosl/lib..__nrf__lib__at_host.a \
	bosl/lib..__nrf__lib__fatal_error.a \
	bosl/lib..__nrf__lib__modem_antenna.a \
	bosl/libtfm_api_nrf.a \
	bosl/libtfm_api.a \
	bosl/libmodules__hal_nordic__nrfx.a \
	bosl/libmodem.a \
"
LINK_OPTIONS="\
	-gdwarf-4 \
	-fuse-ld=bfd \
	-Wl,--gc-sections \
	-Wl,--build-id=none \
	-Wl,--sort-common=descending \
	-Wl,--sort-section=alignment \
	-Wl,-u,_OffsetAbsSyms \
	-Wl,-u,_ConfigAbsSyms \
	-Wl,-X \
	-Wl,-N \
	-Wl,--orphan-handling=warn \
	-Wl,-no-pie \
	-DPICOLIBC_DOUBLE_PRINTF_SCANF \
	-mcpu=cortex-m33 \
	-mthumb \
	-mabi=aapcs \
	-mfp16-format=ieee \
	-nostdlib \
	-static \
	--specs=picolibc.specs \
"
#	-Wl,-L"${BASE_DIR}/build/bosl/" \
#	-Lzephyr \
#	-Wl,--library-path=./bosl \

#-------------------------------------------------------------------------------
echo Step [zephyr_pre0.elf]
cd build
${TOOLCHAIN_BIN_PATH}/arm-zephyr-eabi-g++.exe  \
		${OBJECTS} \
	-T zephyr/linker_zephyr_pre0.cmd \
	-Wl,-Map=zephyr/zephyr_pre0.map \
	${LINK_OPTIONS} \
	-Wl,--whole-archive \
		${WHOLE_LIBS} \
		app/libapp.a \
	-Wl,--no-whole-archive \
		bosl/libkernel.a \
		bosl/libisr_tables.a \
	-lgcc \
	-lc \
	-o zephyr/zephyr_pre0.elf 
cd - > /dev/null



#-------------------------------------------------------------------------------
echo Step [isrList.bin]
cd build/zephyr
${TOOLCHAIN_BIN_PATH}/arm-zephyr-eabi-objcopy.exe \
	--input-target=elf32-littlearm \
	--output-target=binary \
	--only-section=.intList \
    zephyr_pre0.elf \
    isrList.bin
echo Step [isr_tables.c]
python.exe ${PY_SCRIPTS_PATH}/gen_isr_tables.py \
	--output-source isr_tables.c \
	--kernel zephyr_pre0.elf \
	--intlist isrList.bin \
	--sw-isr-table \
	--vector-table
cd - > /dev/null
echo Step [isr_tables.c.obj]
cd build
${TOOLCHAIN_BIN_PATH}/arm-zephyr-eabi-gcc.exe \
	-DKERNEL \
	-DMBEDTLS_CONFIG_FILE=/"nrf-config.h/" \
	-DMBEDTLS_USER_CONFIG_FILE=/"nrf-config-user.h/" \
	-DNRF9160_XXAA \
	-DNRF_SKIP_FICR_NS_COPY_TO_RAM \
	-DNRF_TRUSTZONE_NONSECURE \
	-DPICOLIBC_DOUBLE_PRINTF_SCANF \
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
	-Wno-pointer-sign \
	-Wpointer-arith \
	-Wexpansion-to-defined \
	-Wno-unused-but-set-variable \
	-Werror=implicit-int \
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
	-std=c99 \
	-MD \
	-MT zephyr/CMakeFiles/zephyr_final.dir/isr_tables.c.obj \
	-MF zephyr/CMakeFiles/zephyr_final.dir/isr_tables.c.obj.d \
	-o zephyr/CMakeFiles/zephyr_final.dir/isr_tables.c.obj \
	-c C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/zephyr/isr_tables.c
cd - > /dev/null


#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
echo Step [zephyr.elf]
cd build
${TOOLCHAIN_BIN_PATH}/arm-zephyr-eabi-g++.exe  \
	-T zephyr/linker.cmd \
	-Wl,-Map=zephyr/zephyr_final.map \
	-Wl,--print-memory-usage \
	${LINK_OPTIONS} \
	${ISR_TABLES_C_OBJ} \
	${OBJECTS} \
	-Wl,--whole-archive \
		${WHOLE_LIBS} \
	-Wl,--no-whole-archive \
		bosl/libkernel.a \
		bosl/libisr_tables.a \
	-lgcc \
	-lc \
    -Wl,--whole-archive \
		app/libapp.a \
	-o zephyr/zephyr.elf 
cd - > /dev/null

#-------------------------------------------------------------------------------
echo Step [Final_2] - zephyr.hex
cd build/zephyr
${TOOLCHAIN_BIN_PATH}/arm-zephyr-eabi-objcopy.exe \
	--gap-fill 0xff \
	--output-target=ihex \
	--remove-section=.comment \
	--remove-section=COMMON \
	--remove-section=.eh_frame zephyr.elf \
    zephyr.hex
cd - > /dev/null

#-------------------------------------------------------------------------------
echo Step [merged.hex]
cd build
python.exe ${PY_SCRIPTS_PATH}/mergehex.py \
	-o zephyr/tfm_nonsecure.hex \
    zephyr/zephyr.hex
python.exe ${PY_SCRIPTS_PATH}/mergehex.py \
	-o zephyr/merged.hex \
	--overlap=replace \
    	zephyr/tfm_secure.hex \
    	zephyr/tfm_nonsecure.hex \
    	tfm/bin/tfm_s.hex \
    	zephyr/zephyr.hex
cd - > /dev/null



#-------------------------------------------------------------------------------
echo
echo eda1cdd6dc91f667bc060c5d8f85d63b
md5sum ${BASE_DIR}/build/zephyr/merged.hex | cut -f 1 -d ' '     # expected eda1cdd6dc91f667bc060c5d8f85d63b
