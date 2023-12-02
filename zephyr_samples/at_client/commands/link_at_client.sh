#!/bin/bash

set -e

# Ninja link output
# [0/17] cmd.exe /C "cd /D C:\Users\Dejan\Documents\Dev\bosl\BoslArduinoPackage\zephyr_samples\at_client\build\tfm && "C:\Program Files\CMake\bin\cmake.exe" --build . -j 1"
# [2/11] cmd.exe /C "cd /D C:\Users\Dejan\Documents\Dev\bosl\BoslArduinoPackage\zephyr_samples\at_client\build\tfm && "C:\Program Files\CMake\bin\cmake.exe" --install ."
# [3/11] cmd.exe /C "cd /D C:\Users\Dejan\Documents\Dev\bosl\BoslArduinoPackage\zephyr_samples\at_client\build\modules\trusted-firmware-m && "C:\Program Files\CMake\bin\cmake.exe" -E make_directory C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/modules/trusted-firmware-m/CMakeFiles && "C:\Program Files\CMake\bin\cmake.exe" -E touch C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/modules/trusted-firmware-m/CMakeFiles/tfm-complete && "C:\Program Files\CMake\bin\cmake.exe" -E touch C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/modules/trusted-firmware-m/tfm-prefix/src/tfm-stamp/tfm-done"
# [4/11] cmd.exe /C "cd . && "C:\Program Files\CMake\bin\cmake.exe" -E rm -f zephyr\libzephyr.a && C:\ncs\toolchains\c57af46cb7\opt\zephyr-sdk\arm-zephyr-eabi\bin\arm-zephyr-eabi-ar.exe qc zephyr\libzephyr.a  zephyr/CMakeFiles/zephyr.dir/lib/cpp/abi/cpp_init.c.obj zephyr/CMakeFiles/zephyr.dir/lib/cpp/abi/cpp_init_array.c.obj zephyr/CMakeFiles/zephyr.dir/lib/cpp/abi/cpp_ctors.c.obj zephyr/CMakeFiles/zephyr.dir/lib/cpp/abi/cpp_dtors.c.obj zephyr/CMakeFiles/zephyr.dir/lib/cpp/minimal/cpp_virtual.c.obj zephyr/CMakeFiles/zephyr.dir/lib/cpp/minimal/cpp_vtable.cpp.obj zephyr/CMakeFiles/zephyr.dir/lib/cpp/minimal/cpp_new.cpp.obj zephyr/CMakeFiles/zephyr.dir/lib/os/cbprintf_packaged.c.obj zephyr/CMakeFiles/zephyr.dir/lib/os/dec.c.obj zephyr/CMakeFiles/zephyr.dir/lib/os/fdtable.c.obj zephyr/CMakeFiles/zephyr.dir/lib/os/hex.c.obj zephyr/CMakeFiles/zephyr.dir/lib/os/printk.c.obj zephyr/CMakeFiles/zephyr.dir/lib/os/rb.c.obj zephyr/CMakeFiles/zephyr.dir/lib/os/sem.c.obj zephyr/CMakeFiles/zephyr.dir/lib/os/thread_entry.c.obj zephyr/CMakeFiles/zephyr.dir/lib/os/timeutil.c.obj zephyr/CMakeFiles/zephyr.dir/lib/os/heap.c.obj zephyr/CMakeFiles/zephyr.dir/lib/os/heap-validate.c.obj zephyr/CMakeFiles/zephyr.dir/lib/os/bitarray.c.obj zephyr/CMakeFiles/zephyr.dir/lib/os/multi_heap.c.obj zephyr/CMakeFiles/zephyr.dir/lib/os/onoff.c.obj zephyr/CMakeFiles/zephyr.dir/lib/os/notify.c.obj zephyr/CMakeFiles/zephyr.dir/lib/os/cbprintf_complete.c.obj zephyr/CMakeFiles/zephyr.dir/lib/os/ring_buffer.c.obj zephyr/CMakeFiles/zephyr.dir/lib/os/assert.c.obj zephyr/CMakeFiles/zephyr.dir/lib/os/reboot.c.obj zephyr/CMakeFiles/zephyr.dir/misc/generated/configs.c.obj zephyr/CMakeFiles/zephyr.dir/soc/arm/nordic_nrf/nrf91/soc.c.obj zephyr/CMakeFiles/zephyr.dir/soc/arm/nordic_nrf/common/soc_nrf_common.S.obj zephyr/CMakeFiles/zephyr.dir/soc/arm/nordic_nrf/common/soc_secure.c.obj zephyr/CMakeFiles/zephyr.dir/soc/arm/nordic_nrf/validate_base_addresses.c.obj zephyr/CMakeFiles/zephyr.dir/soc/arm/nordic_nrf/validate_enabled_instances.c.obj zephyr/CMakeFiles/zephyr.dir/subsys/tracing/tracing_none.c.obj zephyr/CMakeFiles/zephyr.dir/subsys/net/lib/utils/addr_utils.c.obj zephyr/CMakeFiles/zephyr.dir/subsys/net/lib/sockets/getaddrinfo.c.obj zephyr/CMakeFiles/zephyr.dir/subsys/net/lib/sockets/sockets.c.obj zephyr/CMakeFiles/zephyr.dir/subsys/net/lib/sockets/sockets_select.c.obj zephyr/CMakeFiles/zephyr.dir/subsys/net/lib/sockets/socket_offload.c.obj zephyr/CMakeFiles/zephyr.dir/C_/ncs/v2.5.0/nrf/subsys/partition_manager/flash_map_partition_manager.c.obj zephyr/CMakeFiles/zephyr.dir/C_/ncs/v2.5.0/modules/lib/Arduino-Zephyr-API/cores/arduino/zephyrPrint.cpp.obj zephyr/CMakeFiles/zephyr.dir/C_/ncs/v2.5.0/modules/lib/Arduino-Zephyr-API/cores/arduino/zephyrSerial.cpp.obj zephyr/CMakeFiles/zephyr.dir/C_/ncs/v2.5.0/modules/lib/Arduino-Zephyr-API/cores/arduino/zephyrCommon.cpp.obj zephyr/CMakeFiles/zephyr.dir/C_/ncs/v2.5.0/modules/lib/Arduino-Zephyr-API/cores/arduino/main.cpp.obj zephyr/CMakeFiles/zephyr.dir/C_/ncs/v2.5.0/modules/lib/Arduino-Zephyr-API/libraries/Wire/Wire.cpp.obj && C:\ncs\toolchains\c57af46cb7\opt\zephyr-sdk\arm-zephyr-eabi\bin\arm-zephyr-eabi-ranlib.exe zephyr\libzephyr.a && cd ."
# [5/11] cmd.exe /C "cd . && C:\ncs\toolchains\c57af46cb7\opt\zephyr-sdk\arm-zephyr-eabi\bin\arm-zephyr-eabi-g++.exe  -gdwarf-4 @CMakeFiles\zephyr_pre0.rsp -o zephyr\zephyr_pre0.elf  && cmd.exe /C "cd /D C:\Users\Dejan\Documents\Dev\bosl\BoslArduinoPackage\zephyr_samples\at_client\build\zephyr && "C:\Program Files\CMake\bin\cmake.exe" -E true""
# [6/11] cmd.exe /C "cd /D C:\Users\Dejan\Documents\Dev\bosl\BoslArduinoPackage\zephyr_samples\at_client\build\zephyr && C:\ncs\toolchains\c57af46cb7\opt\zephyr-sdk\arm-zephyr-eabi\bin\arm-zephyr-eabi-gcc.exe -x assembler-with-cpp -undef -MD -MF linker.cmd.dep -MT linker.cmd -D_LINKER -D_ASMLANGUAGE -imacros C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/zephyr/include/generated/autoconf.h -IC:/ncs/v2.5.0/zephyr/include -IC:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/zephyr/include/generated -IC:/ncs/v2.5.0/zephyr/soc/arm/nordic_nrf/nrf91 -IC:/ncs/v2.5.0/zephyr/lib/cpp/minimal/include -IC:/ncs/v2.5.0/zephyr/soc/arm/nordic_nrf/common/. -IC:/ncs/v2.5.0/zephyr/subsys/net/lib/sockets/. -IC:/ncs/v2.5.0/nrf/include -IC:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/tfm/install/interface/include -IC:/ncs/v2.5.0/nrf/include/tfm -IC:/ncs/v2.5.0/nrf/tests/include -IC:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/tfm/generated/interface/include -IC:/ncs/v2.5.0/modules/hal/cmsis/CMSIS/Core/Include -IC:/ncs/v2.5.0/zephyr/modules/cmsis/. -IC:/ncs/v2.5.0/modules/hal/nordic/nrfx -IC:/ncs/v2.5.0/modules/hal/nordic/nrfx/drivers/include -IC:/ncs/v2.5.0/modules/hal/nordic/nrfx/mdk -IC:/ncs/v2.5.0/zephyr/modules/hal_nordic/nrfx/. -IC:/ncs/v2.5.0/modules/lib/Arduino-Zephyr-API/cores/arduino/. -IC:/ncs/v2.5.0/modules/lib/Arduino-Zephyr-API/cores/arduino/../../variants -IC:/ncs/v2.5.0/modules/lib/Arduino-Zephyr-API/variants/. -IC:/ncs/v2.5.0/modules/lib/Arduino-Zephyr-API/variants/nrf9160dk_nrf9160_ns -IC:/ncs/v2.5.0/modules/lib/Arduino-Zephyr-API/libraries/Wire/. -IC:/ncs/v2.5.0/nrfxlib/nrf_modem/include -D__GCC_LINKER_CMD__ -DUSE_PARTITION_MANAGER=1 -DLINKER_ZEPHYR_FINAL -E C:/ncs/v2.5.0/zephyr/soc/arm/nordic_nrf/nrf91/linker.ld -P -o linker.cmd && "C:\Program Files\CMake\bin\cmake.exe" -E cmake_transform_depfile Ninja gccdepfile C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client C:/ncs/v2.5.0/zephyr C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/zephyr C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/zephyr/linker.cmd.dep C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/CMakeFiles/d/350858f1b181a90f7ee43eedf495c2b82b3f693f05933b1274c6f3a48b6df66e.d"
# [7/11] cmd.exe /C "cd /D C:\Users\Dejan\Documents\Dev\bosl\BoslArduinoPackage\zephyr_samples\at_client\build\zephyr && C:\ncs\toolchains\c57af46cb7\opt\zephyr-sdk\arm-zephyr-eabi\bin\arm-zephyr-eabi-objcopy.exe --input-target=elf32-littlearm --output-target=binary --only-section=.intList C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/zephyr/zephyr_pre0.elf isrList.bin && C:\ncs\toolchains\c57af46cb7\opt\bin\python.exe C:/ncs/v2.5.0/zephyr/scripts/build/gen_isr_tables.py --output-source isr_tables.c --kernel C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/zephyr/zephyr_pre0.elf --intlist isrList.bin --sw-isr-table --vector-table"
# [8/11] C:\ncs\toolchains\c57af46cb7\opt\zephyr-sdk\arm-zephyr-eabi\bin\arm-zephyr-eabi-gcc.exe -DKERNEL -DMBEDTLS_CONFIG_FILE=\"nrf-config.h\" -DMBEDTLS_USER_CONFIG_FILE=\"nrf-config-user.h\" -DNRF9160_XXAA -DNRF_SKIP_FICR_NS_COPY_TO_RAM -DNRF_TRUSTZONE_NONSECURE -DPICOLIBC_DOUBLE_PRINTF_SCANF -DUSE_PARTITION_MANAGER=1 -D_FORTIFY_SOURCE=1 -D_POSIX_C_SOURCE=200809 -D__LINUX_ERRNO_EXTENSIONS__ -D__PROGRAM_START -D__ZEPHYR__=1 -IC:/ncs/v2.5.0/zephyr/include -IC:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/zephyr/include/generated -IC:/ncs/v2.5.0/zephyr/soc/arm/nordic_nrf/nrf91 -IC:/ncs/v2.5.0/zephyr/soc/arm/nordic_nrf/common/. -IC:/ncs/v2.5.0/zephyr/subsys/net/lib/sockets/. -IC:/ncs/v2.5.0/nrf/include -IC:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/tfm/install/interface/include -IC:/ncs/v2.5.0/nrf/include/tfm -IC:/ncs/v2.5.0/nrf/tests/include -IC:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/tfm/generated/interface/include -IC:/ncs/v2.5.0/modules/hal/cmsis/CMSIS/Core/Include -IC:/ncs/v2.5.0/zephyr/modules/cmsis/. -IC:/ncs/v2.5.0/modules/hal/nordic/nrfx -IC:/ncs/v2.5.0/modules/hal/nordic/nrfx/drivers/include -IC:/ncs/v2.5.0/modules/hal/nordic/nrfx/mdk -IC:/ncs/v2.5.0/zephyr/modules/hal_nordic/nrfx/. -IC:/ncs/v2.5.0/modules/lib/Arduino-Zephyr-API/cores/arduino/. -IC:/ncs/v2.5.0/modules/lib/Arduino-Zephyr-API/cores/arduino/../../variants -IC:/ncs/v2.5.0/modules/lib/Arduino-Zephyr-API/variants/. -IC:/ncs/v2.5.0/modules/lib/Arduino-Zephyr-API/variants/nrf9160dk_nrf9160_ns -IC:/ncs/v2.5.0/modules/lib/Arduino-Zephyr-API/libraries/Wire/. -IC:/ncs/v2.5.0/nrfxlib/nrf_modem/include -IC:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/modules/nrf/subsys/nrf_security/src/include/generated -IC:/ncs/v2.5.0/nrf/subsys/nrf_security/include -IC:/ncs/v2.5.0/nrf/ext/oberon/psa/core/include -IC:/ncs/v2.5.0/nrf/ext/oberon/psa/core/library -IC:/ncs/v2.5.0/modules/crypto/mbedtls/include -IC:/ncs/v2.5.0/modules/crypto/mbedtls/library -IC:/ncs/v2.5.0/nrfxlib/crypto/nrf_oberon/include/mbedtls -IC:/ncs/v2.5.0/nrfxlib/crypto/nrf_oberon/include -isystem C:/ncs/v2.5.0/zephyr/lib/cpp/minimal/include -fno-strict-aliasing -Os -imacros C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/zephyr/include/generated/autoconf.h -fno-common -g -gdwarf-4 -fdiagnostics-color=always -mcpu=cortex-m33 -mthumb -mabi=aapcs -mfp16-format=ieee --sysroot=C:/ncs/toolchains/c57af46cb7/opt/zephyr-sdk/arm-zephyr-eabi/arm-zephyr-eabi -imacros C:/ncs/v2.5.0/zephyr/include/zephyr/toolchain/zephyr_stdint.h -Wall -Wformat -Wformat-security -Wno-format-zero-length -Wno-pointer-sign -Wpointer-arith -Wexpansion-to-defined -Wno-unused-but-set-variable -Werror=implicit-int -fno-pic -fno-pie -fno-asynchronous-unwind-tables -ftls-model=local-exec -fno-reorder-functions --param=min-pagesize=0 -fno-defer-pop -fmacro-prefix-map=C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client=CMAKE_SOURCE_DIR -fmacro-prefix-map=C:/ncs/v2.5.0/zephyr=ZEPHYR_BASE -fmacro-prefix-map=C:/ncs/v2.5.0=WEST_TOPDIR -ffunction-sections -fdata-sections --specs=picolibc.specs -std=c99 -MD -MT zephyr/CMakeFiles/zephyr_final.dir/isr_tables.c.obj -MF zephyr\CMakeFiles\zephyr_final.dir\isr_tables.c.obj.d -o zephyr/CMakeFiles/zephyr_final.dir/isr_tables.c.obj -c C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/zephyr/isr_tables.c
# [9/11] cmd.exe /C "cd . && C:\ncs\toolchains\c57af46cb7\opt\zephyr-sdk\arm-zephyr-eabi\bin\arm-zephyr-eabi-g++.exe  -gdwarf-4 @CMakeFiles\zephyr_final.rsp -o zephyr\zephyr.elf  && cmd.exe /C "cd /D C:\Users\Dejan\Documents\Dev\bosl\BoslArduinoPackage\zephyr_samples\at_client\build\zephyr && "C:\Program Files\CMake\bin\cmake.exe" -E copy zephyr_final.map zephyr.map && C:\ncs\toolchains\c57af46cb7\opt\zephyr-sdk\arm-zephyr-eabi\bin\arm-zephyr-eabi-objcopy.exe --gap-fill 0xff --output-target=ihex --remove-section=.comment --remove-section=COMMON --remove-section=.eh_frame zephyr.elf zephyr.hex && C:\ncs\toolchains\c57af46cb7\opt\zephyr-sdk\arm-zephyr-eabi\bin\arm-zephyr-eabi-objcopy.exe --gap-fill 0xff --output-target=binary --remove-section=.comment --remove-section=COMMON --remove-section=.eh_frame zephyr.elf zephyr.bin && C:\ncs\toolchains\c57af46cb7\opt\zephyr-sdk\arm-zephyr-eabi\bin\arm-zephyr-eabi-readelf.exe -e zephyr.elf > zephyr.stat && C:\ncs\toolchains\c57af46cb7\opt\bin\python.exe C:/ncs/v2.5.0/zephyr/scripts/build/check_init_priorities.py --build-dir C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/zephyr/.. --edt-pickle C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/zephyr/edt.pickle && C:\ncs\toolchains\c57af46cb7\opt\bin\python.exe C:/ncs/v2.5.0/zephyr/scripts/build/mergehex.py -o C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/zephyr/tfm_merged.hex C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/tfm/bin/tfm_s.hex C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/zephyr/zephyr.hex""
# [10/11] cmd.exe /C "cd /D C:\Users\Dejan\Documents\Dev\bosl\BoslArduinoPackage\zephyr_samples\at_client\build && C:\ncs\toolchains\c57af46cb7\opt\bin\python.exe C:/ncs/v2.5.0/zephyr/scripts/build/mergehex.py -o C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/zephyr/tfm_nonsecure.hex C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/zephyr/zephyr.hex"
# [11/11] cmd.exe /C "cd /D C:\Users\Dejan\Documents\Dev\bosl\BoslArduinoPackage\zephyr_samples\at_client\build && C:\ncs\toolchains\c57af46cb7\opt\bin\python.exe C:/ncs/v2.5.0/zephyr/scripts/build/mergehex.py -o C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/zephyr/merged.hex --overlap=replace C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/zephyr/tfm_secure.hex C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/zephyr/tfm_nonsecure.hex C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/tfm/bin/tfm_s.hex C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/zephyr/zephyr.hex"


MY_DIR=$(realpath $(dirname $0))
BASE_DIR=${MY_DIR}/..

PY_SCRIPTS_PATH=C:/ncs/v2.5.0/zephyr/scripts/build
TOOLCHAIN_BIN_PATH=C:/ncs/toolchains/c57af46cb7/opt/zephyr-sdk/arm-zephyr-eabi/bin

touch ${BASE_DIR}/at_client.cpp
cd ${BASE_DIR}

rm -f ${BASE_DIR}/build/zephyr/merged.hex
rm -f ${BASE_DIR}/build/zephyr/zephyr.hex


#-------------------------------------------------------------------------------
# echo Step [0/17] 
# cd build/tfm
# cmake --build . -j 1
# cd - > /dev/null

#-------------------------------------------------------------------------------
# echo Step [2/12] 
# cd build/tfm
# cmake --install .
# cd - > /dev/null

#-------------------------------------------------------------------------------
# echo Step [3/12] 
# cd build/modules/trusted-firmware-m
# cmake -E make_directory CMakeFiles
# cmake -E touch CMakeFiles/tfm-complete
# cmake -E touch tfm-prefix/src/tfm-stamp/tfm-done
# cd - > /dev/null

#-------------------------------------------------------------------------------
echo Step [4/12] - libzephyr.a
cd build
rm -f zephyr/libzephyr.a
${TOOLCHAIN_BIN_PATH}/arm-zephyr-eabi-ar.exe \
    qc zephyr/libzephyr.a \
    zephyr/CMakeFiles/zephyr.dir/lib/cpp/abi/cpp_init.c.obj \
    zephyr/CMakeFiles/zephyr.dir/lib/cpp/abi/cpp_init_array.c.obj \
    zephyr/CMakeFiles/zephyr.dir/lib/cpp/abi/cpp_ctors.c.obj \
    zephyr/CMakeFiles/zephyr.dir/lib/cpp/abi/cpp_dtors.c.obj \
    zephyr/CMakeFiles/zephyr.dir/lib/cpp/minimal/cpp_virtual.c.obj \
    zephyr/CMakeFiles/zephyr.dir/lib/cpp/minimal/cpp_vtable.cpp.obj \
    zephyr/CMakeFiles/zephyr.dir/lib/cpp/minimal/cpp_new.cpp.obj \
    zephyr/CMakeFiles/zephyr.dir/lib/os/cbprintf_packaged.c.obj \
    zephyr/CMakeFiles/zephyr.dir/lib/os/dec.c.obj \
    zephyr/CMakeFiles/zephyr.dir/lib/os/fdtable.c.obj \
    zephyr/CMakeFiles/zephyr.dir/lib/os/hex.c.obj \
    zephyr/CMakeFiles/zephyr.dir/lib/os/printk.c.obj \
    zephyr/CMakeFiles/zephyr.dir/lib/os/rb.c.obj \
    zephyr/CMakeFiles/zephyr.dir/lib/os/sem.c.obj \
    zephyr/CMakeFiles/zephyr.dir/lib/os/thread_entry.c.obj \
    zephyr/CMakeFiles/zephyr.dir/lib/os/timeutil.c.obj \
    zephyr/CMakeFiles/zephyr.dir/lib/os/heap.c.obj \
    zephyr/CMakeFiles/zephyr.dir/lib/os/heap-validate.c.obj \
    zephyr/CMakeFiles/zephyr.dir/lib/os/bitarray.c.obj \
    zephyr/CMakeFiles/zephyr.dir/lib/os/multi_heap.c.obj \
    zephyr/CMakeFiles/zephyr.dir/lib/os/onoff.c.obj \
    zephyr/CMakeFiles/zephyr.dir/lib/os/notify.c.obj \
    zephyr/CMakeFiles/zephyr.dir/lib/os/cbprintf_complete.c.obj \
    zephyr/CMakeFiles/zephyr.dir/lib/os/ring_buffer.c.obj \
    zephyr/CMakeFiles/zephyr.dir/lib/os/assert.c.obj \
    zephyr/CMakeFiles/zephyr.dir/lib/os/reboot.c.obj \
	zephyr/CMakeFiles/zephyr.dir/misc/generated/configs.c.obj \
	zephyr/CMakeFiles/zephyr.dir/soc/arm/nordic_nrf/nrf91/soc.c.obj \
	zephyr/CMakeFiles/zephyr.dir/soc/arm/nordic_nrf/common/soc_nrf_common.S.obj \
	zephyr/CMakeFiles/zephyr.dir/soc/arm/nordic_nrf/common/soc_secure.c.obj \
	zephyr/CMakeFiles/zephyr.dir/soc/arm/nordic_nrf/validate_base_addresses.c.obj \
	zephyr/CMakeFiles/zephyr.dir/soc/arm/nordic_nrf/validate_enabled_instances.c.obj \
	zephyr/CMakeFiles/zephyr.dir/subsys/tracing/tracing_none.c.obj \
	zephyr/CMakeFiles/zephyr.dir/subsys/net/lib/utils/addr_utils.c.obj \
	zephyr/CMakeFiles/zephyr.dir/subsys/net/lib/sockets/getaddrinfo.c.obj \
	zephyr/CMakeFiles/zephyr.dir/subsys/net/lib/sockets/sockets.c.obj \
	zephyr/CMakeFiles/zephyr.dir/subsys/net/lib/sockets/sockets_select.c.obj \
	zephyr/CMakeFiles/zephyr.dir/subsys/net/lib/sockets/socket_offload.c.obj \
	zephyr/CMakeFiles/zephyr.dir/C_/ncs/v2.5.0/nrf/subsys/partition_manager/flash_map_partition_manager.c.obj \
	zephyr/CMakeFiles/zephyr.dir/C_/ncs/v2.5.0/modules/lib/Arduino-Zephyr-API/cores/arduino/zephyrPrint.cpp.obj \
	zephyr/CMakeFiles/zephyr.dir/C_/ncs/v2.5.0/modules/lib/Arduino-Zephyr-API/cores/arduino/zephyrSerial.cpp.obj \
	zephyr/CMakeFiles/zephyr.dir/C_/ncs/v2.5.0/modules/lib/Arduino-Zephyr-API/cores/arduino/zephyrCommon.cpp.obj \
	zephyr/CMakeFiles/zephyr.dir/C_/ncs/v2.5.0/modules/lib/Arduino-Zephyr-API/cores/arduino/main.cpp.obj \
	zephyr/CMakeFiles/zephyr.dir/C_/ncs/v2.5.0/modules/lib/Arduino-Zephyr-API/libraries/Wire/Wire.cpp.obj
${TOOLCHAIN_BIN_PATH}/arm-zephyr-eabi-ranlib.exe \
    zephyr/libzephyr.a
cd - > /dev/null

#-------------------------------------------------------------------------------
echo Step [5/12] - zephyr_pre0.elf
cd build
${TOOLCHAIN_BIN_PATH}/arm-zephyr-eabi-g++.exe  \
	@${BASE_DIR}/zephyr_pre0.rsp \
    -Wl,--whole-archive app/libapp.a \
	-o zephyr/zephyr_pre0.elf 
cd - > /dev/null

#-------------------------------------------------------------------------------
echo Step [6/12] - linker.cmd
cd build/zephyr
${TOOLCHAIN_BIN_PATH}/arm-zephyr-eabi-gcc.exe \
	-x assembler-with-cpp \
	-undef \
	-MD \
	-MF linker.cmd.dep \
	-MT linker.cmd \
	-D_LINKER \
	-D_ASMLANGUAGE \
	-imacros C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/zephyr/include/generated/autoconf.h \
	-IC:/ncs/v2.5.0/zephyr/include \
	-IC:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/zephyr_samples/at_client/build/zephyr/include/generated \
	-IC:/ncs/v2.5.0/zephyr/soc/arm/nordic_nrf/nrf91 \
	-IC:/ncs/v2.5.0/zephyr/lib/cpp/minimal/include \
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
	-D__GCC_LINKER_CMD__ \
	-DUSE_PARTITION_MANAGER=1 \
	-DLINKER_ZEPHYR_FINAL \
	-E C:/ncs/v2.5.0/zephyr/soc/arm/nordic_nrf/nrf91/linker.ld \
	-P \
	-o linker.cmd 
cd - > /dev/null

#-------------------------------------------------------------------------------
echo Step [7/12] - isr_tables.c
cd build/zephyr
${TOOLCHAIN_BIN_PATH}/arm-zephyr-eabi-objcopy.exe \
	--input-target=elf32-littlearm \
	--output-target=binary \
	--only-section=.intList \
    zephyr_pre0.elf \
    isrList.bin
python.exe ${PY_SCRIPTS_PATH}/gen_isr_tables.py \
	--output-source isr_tables.c \
	--kernel zephyr_pre0.elf \
	--intlist isrList.bin \
	--sw-isr-table \
	--vector-table
cd - > /dev/null

#-------------------------------------------------------------------------------
echo Step [8/12] - isr_tables.c.obj
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
echo Step [9/12] - zephyr.elf
cd build
${TOOLCHAIN_BIN_PATH}/arm-zephyr-eabi-g++.exe  \
	-gdwarf-4 \
	@${BASE_DIR}/zephyr_final.rsp \
    -Wl,--whole-archive \
	app/libapp.a \
	-o zephyr/zephyr.elf 
cd - > /dev/null

echo Step [9.1/12] - zephyr.hex
cd build/zephyr
${TOOLCHAIN_BIN_PATH}/arm-zephyr-eabi-objcopy.exe \
	--gap-fill 0xff \
	--output-target=ihex \
	--remove-section=.comment \
	--remove-section=COMMON \
	--remove-section=.eh_frame zephyr.elf \
    zephyr.hex
# Not necessary
#${TOOLCHAIN_BIN_PATH}/arm-zephyr-eabi-objcopy.exe \
#	--gap-fill 0xff \
#	--output-target=binary \
#	--remove-section=.comment \
#	--remove-section=COMMON \
#	--remove-section=.eh_frame zephyr.elf \
#   zephyr.bin \
#${TOOLCHAIN_BIN_PATH}/arm-zephyr-eabi-readelf.exe \
#	-e zephyr.elf > zephyr.stat
python.exe ${PY_SCRIPTS_PATH}/check_init_priorities.py \
	--build-dir . \
	--edt-pickle edt.pickle
#python.exe ${PY_SCRIPTS_PATH}/mergehex.py \
#	-o tfm_merged.hex \
#	../tfm/bin/tfm_s.hex \
#	zephyr.hex
cd - > /dev/null


#-------------------------------------------------------------------------------
echo Step [10/12] - merged.hex
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

echo
echo eda1cdd6dc91f667bc060c5d8f85d63b
md5sum ${BASE_DIR}/build/zephyr/merged.hex | cut -f 1 -d ' '     # expected eda1cdd6dc91f667bc060c5d8f85d63b
exit

#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# Attempt by dd to create libbosl.a
echo Step [ddd_1] - libbosl.a
cd build
${TOOLCHAIN_BIN_PATH}/arm-zephyr-eabi-ar.exe \
    qc zephyr/libbosl.a \
		zephyr/CMakeFiles/zephyr_final.dir/misc/empty_file.c.obj \
		zephyr/CMakeFiles/zephyr_final.dir/isr_tables.c.obj \
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
cd - > /dev/null




#-------------------------------------------------------------------------------
echo Step [ddd_2] - unpack libbosl.a
rm -rf build/bosl
mkdir -p build/bosl
cd build/bosl
cp ../zephyr/libbosl.a .
${TOOLCHAIN_BIN_PATH}/arm-zephyr-eabi-ar.exe \
	x libbosl.a
cd - > /dev/null

#-------------------------------------------------------------------------------
echo Step [ddd_3] - zephyr_ddd.elf
cd build
${TOOLCHAIN_BIN_PATH}/arm-zephyr-eabi-g++.exe  \
	-gdwarf-4 \
		bosl/empty_file.c.obj \
		bosl/isr_tables.c.obj \
		bosl/offsets.c.obj \
		bosl/s_veneers.o \
	-fuse-ld=bfd \
	-T zephyr/linker.cmd \
	-Wl,-Map=zephyr/zephyr_final.map \
	-Wl,--whole-archive \
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
	-Wl,--no-whole-archive \
		bosl/libkernel.a \
		bosl/libisr_tables.a \
	-lgcc \
	-Wl,--print-memory-usage \
	-Wl,--gc-sections \
	-Wl,--build-id=none \
	-Wl,--sort-common=descending \
	-Wl,--sort-section=alignment \
	-Wl,-u,_OffsetAbsSyms \
	-Wl,-u,_ConfigAbsSyms \
	-nostdlib \
	-static \
	-Wl,-X \
	-Wl,-N \
	-Wl,--orphan-handling=warn \
	-Wl,-no-pie \
	-DPICOLIBC_DOUBLE_PRINTF_SCANF \
	-mcpu=cortex-m33 \
	-mthumb \
	-mabi=aapcs \
	-mfp16-format=ieee \
	--specs=picolibc.specs \
	-lc \
	-lgcc \
    -Wl,--whole-archive \
		app/libapp.a \
	-o zephyr/zephyr_ddd.elf 
cd - > /dev/null

#-------------------------------------------------------------------------------
echo Step [ddd_4] - zephyr_ddd.hex
cd build/zephyr
${TOOLCHAIN_BIN_PATH}/arm-zephyr-eabi-objcopy.exe \
	--gap-fill 0xff \
	--output-target=ihex \
	--remove-section=.comment \
	--remove-section=COMMON \
	--remove-section=.eh_frame zephyr_ddd.elf \
    zephyr_ddd.hex
cd - > /dev/null

#-------------------------------------------------------------------------------
echo Step [ddd_5] - merged_ddd.hex
cd build
python.exe ${PY_SCRIPTS_PATH}/mergehex.py \
	-o zephyr/tfm_nonsecure.hex \
    zephyr/zephyr_ddd.hex
python.exe ${PY_SCRIPTS_PATH}/mergehex.py \
	-o zephyr/merged_ddd.hex \
	--overlap=replace \
    zephyr/tfm_secure.hex \
    zephyr/tfm_nonsecure.hex \
    tfm/bin/tfm_s.hex \
    zephyr/zephyr_ddd.hex
# Attempt ends here



echo
echo eda1cdd6dc91f667bc060c5d8f85d63b
md5sum ${BASE_DIR}/build/zephyr/merged.hex | cut -f 1 -d ' '     # expected eda1cdd6dc91f667bc060c5d8f85d63b
md5sum ${BASE_DIR}/build/zephyr/merged_ddd.hex | cut -f 1 -d ' '     # expected eda1cdd6dc91f667bc060c5d8f85d63b
