#!/bin/bash


#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#
# This script prepares necessary files for the BoSL Arduino Package using 
# nFR9160dk board and Zephyr dev kit. The package relies on a simple project 
# being pre-built by Zephyr. Once that is complete, we collect necessary 
# include files and built libraries, and we package them, so that Arduino
# can link them together into a working executable.
#
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
#
# Setup paths
#
MY_DIR=$(realpath $(dirname $0))
HARDWARE_DIR=${MY_DIR}/bosl/hardware/nrf9160/1.0.0
SAMPLE_DIR=${MY_DIR}/sample_zephyr_project
ZEPHYR_BASE=~/Documents/Dev/bosl/zephyr/zephyrproject

# NOTE: ZEPHYR_BASE points to zephyrproject which resides outside of this 
#		project. Its location is  dependent on the development setup for  
#		a particular machine. it may need adjusting for every developer.

if [ ! -d ${SAMPLE_DIR}/build/zephyr/include/generated ]; then
	echo 'Error: Sample project (sample_zephyr_project) appears not to have been built. '
	echo '       Please build sample_zephyr_project zephyr and try again.'
	exit
fi
if [ ! -d ${ZEPHYR_BASE} ]; then
	echo 'Error: Zephyr project directory (zephyrproject) cannot be found.'
	echo '       Please point ZEPHYR_BASE to the correct location'
	exit
fi


#-------------------------------------------------------------------------------
#
# Setup tools
#
if [ ! -d ./bosl/tools/arm-zephyr-eabi/share ]; then
	mkdir -p ./bosl/tools/arm-zephyr-eabi
fi
if [ ! -d ./bosl/tools/nrfjprog/share ]; then
	mkdir -p ./bosl/tools/nrfjprog
fi
if [ ! -d ./bosl/tools/gen_isr_tables/share ]; then
	mkdir -p ./bosl/tools/gen_isr_tables/share
fi
./mk_tool_links.bat


#-------------------------------------------------------------------------------
# Usage: copy_headers <source_directory> <destination> [--recursive]
copy_headers() {
	echo "$1"

	mkdir -p "$2"
	cp $3 --update $1 "$2"
}


#-------------------------------------------------------------------------------
#
# Collect includes
#
DST_DIR=${HARDWARE_DIR}/inc

copy_headers ${SAMPLE_DIR}/build/zephyr/include/generated		"${DST_DIR}"		--recursive
copy_headers ${ZEPHYR_BASE}/zephyr/include/zephyr				"${DST_DIR}"/zephyrproject/zephyr/include		--recursive
copy_headers ${ZEPHYR_BASE}/zephyr/modules/cmsis/"*.h"			"${DST_DIR}"/zephyrproject/zephyr/modules/cmsis
copy_headers ${ZEPHYR_BASE}/zephyr/soc/arm/nordic_nrf/nrf91/"*.h"			"${DST_DIR}"/zephyrproject/zephyr/soc/arm/nordic_nrf/nrf91
copy_headers ${ZEPHYR_BASE}/zephyr/soc/arm/nordic_nrf/common/"*.h"			"${DST_DIR}"/zephyrproject/zephyr/soc/arm/nordic_nrf/common
copy_headers ${ZEPHYR_BASE}/modules/lib/Arduino-Zephyr-API/cores/arduino	"${DST_DIR}"/zephyrproject/modules/lib/Arduino-Zephyr-API/cores		--recursive
copy_headers ${ZEPHYR_BASE}/modules/lib/Arduino-Zephyr-API/variants/"*.h"	"${DST_DIR}"/zephyrproject/modules/lib/Arduino-Zephyr-API/variants
copy_headers ${ZEPHYR_BASE}/modules/lib/Arduino-Zephyr-API/variants/nrf9160dk_nrf9160	"${DST_DIR}"/zephyrproject/modules/lib/Arduino-Zephyr-API/variants		--recursive
copy_headers ${ZEPHYR_BASE}/modules/lib/Arduino-Zephyr-API/libraries/Wire/"*.h"			"${DST_DIR}"/zephyrproject/modules/lib/Arduino-Zephyr-API/libraries/Wire
copy_headers ${ZEPHYR_BASE}/modules/hal/cmsis/CMSIS/Core/Include	"${DST_DIR}"/zephyrproject/modules/hal/cmsis/CMSIS/Core		--recursive
copy_headers ${ZEPHYR_BASE}/modules/hal/nordic/nrfx/"*.h"	"${DST_DIR}"/zephyrproject/modules/hal/nordic/nrfx
copy_headers ${ZEPHYR_BASE}/modules/hal/nordic/nrfx/mdk	"${DST_DIR}"/zephyrproject/modules/hal/nordic/nrfx		--recursive
copy_headers ${ZEPHYR_BASE}/modules/hal/nordic/nrfx/hal	"${DST_DIR}"/zephyrproject/modules/hal/nordic/nrfx		--recursive
copy_headers ${ZEPHYR_BASE}/modules/hal/nordic/nrfx/haly	"${DST_DIR}"/zephyrproject/modules/hal/nordic/nrfx		--recursive
copy_headers ${ZEPHYR_BASE}/modules/hal/nordic/nrfx/drivers/"*.h"	"${DST_DIR}"/zephyrproject/modules/hal/nordic/nrfx/drivers/
copy_headers ${ZEPHYR_BASE}/modules/hal/nordic/nrfx/drivers/include/"*.h"	"${DST_DIR}"/zephyrproject/modules/hal/nordic/nrfx/drivers/include
copy_headers ${ZEPHYR_BASE}/zephyr/modules/hal_nordic/nrfx/"*.h"	"${DST_DIR}"/zephyrproject/zephyr/modules/hal_nordic/nrfx
copy_headers ${ZEPHYR_BASE}/zephyr/lib/libc/minimal/include	"${DST_DIR}"/zephyrproject/zephyr/lib/libc/minimal		--recursive
copy_headers ${ZEPHYR_BASE}/zephyr/include/zephyr/toolchain/zephyr_stdint.h	"${DST_DIR}"/zephyrproject/zephyr/include/zephyr/toolchain/

find "${DST_DIR}" -type f ! -iname "*.h" -delete


#-------------------------------------------------------------------------------
#
# Collect libraries
#
echo Collecting Libraries...
DST_DIR=${HARDWARE_DIR}/lib
if [ ! -d ${DST_DIR} ]; then
	mkdir -p ${DST_DIR}
fi
find ${SAMPLE_DIR} -name *.a				-exec cp --update {} "${DST_DIR}" \;
find ${SAMPLE_DIR} -name empty_file.c.obj	-exec cp --update {} "${DST_DIR}" \; -quit
find ${SAMPLE_DIR} -name offsets.c.obj		-exec cp --update {} "${DST_DIR}" \;
cp --update ./bosl/tools/arm-zephyr-eabi/share/lib/gcc/arm-zephyr-eabi/12.2.0/thumb/v8-m.main/nofp/libgcc.a "${DST_DIR}"

rm -rf "${DST_DIR}"/libapp.a

# Collect linker command files
cp ${SAMPLE_DIR}/build/zephyr/linker.cmd				${DST_DIR}
cp ${SAMPLE_DIR}/build/zephyr/linker_zephyr_pre0.cmd	${DST_DIR}/linker_pre0.cmd

#-------------------------------------------------------------------------------
#
# build gen_isr_tables.exe
#
# Zephyr applications link in an unusual way. First they compile and pre-link 
# the application with a dummy isr_table.c. Then they use a python script to 
# generate the final isr_tables.c from the pre-linked image. This new 
# isr_tables.c has to be compiled, before the second link pass can be completed. 
# Instead of distributing the whole python install, here we just build an exe 
# that is needed for generating isr_tables.c
#
echo Freezing gen_isr_tables...
python -m PyInstaller	\
	--log-level WARN	\
	--noconfirm			\
	--paths ${ZEPHYR_BASE}/.venv/Lib/site-packages/elftools/elf \
	--onefile ${ZEPHYR_BASE}/zephyr/scripts/build/gen_isr_tables.py 
	
cp dist/gen_isr_tables.exe bosl/tools/gen_isr_tables/share/
rm -rf build dist gen_isr_tables.spec



