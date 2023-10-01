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
ZEPHYRPROJECT_DIR=${MY_DIR}/zephyrproject
ZEPHYR_TOOLKIT_SRC_DIR=$(realpath $(ls -1 -d ${MY_DIR}/zephyr-sdk-* | head -n 1))/arm-zephyr-eabi
NRFJPROG_SRC_DIR="/c/Program Files/Nordic Semiconductor/nrf-command-line-tools"

ZEPHYR_TOOLKIT_DST_DIR=${MY_DIR}/bosl/tools/arm-zephyr-eabi/12.2.0
NRFJPROG_DST_DIR=${MY_DIR}/bosl/tools/nrfjprog/10.22.1
GEN_ISR_TABLES_DST_DIR=${MY_DIR}/bosl/tools/gen_isr_tables/0.0.0

# NOTE: NRFJPROG_SRC_DIR points to directories residing outside of this project. 
#		Nordic Semiconductor command-line-tools must be installed and their 
#		locations adjusted above accordingly. Please do not commit changes to 
#		repository.

if [ ! -d "${NRFJPROG_SRC_DIR}" ]; then
	echo 'Error: Nordic Programming Tool directory cannot be found.'
	echo '       Please edit this script and point NRFJPROG_SRC_DIR'
	echo '       to the correct location.'
	exit
fi
if [ ! -d "${ZEPHYRPROJECT_DIR}" ]; then
	echo 'Error: Zephyr project directory (zephyrproject) cannot be found.'
	echo '       Please run setup.sh and ensure it completes successfully.'
	exit
fi
if [ ! -d "${ZEPHYR_TOOLKIT_SRC_DIR}" ]; then
	echo 'Error: Zephyr toolkit directory (zephyr-sdk-x.y.z\arm-zephyr-eabi) cannot be found.'
	echo '       Please run setup.sh and ensure it completes successfully.'
	exit
fi
if [ ! -d "${SAMPLE_DIR}/build/zephyr/include/generated" ]; then
	echo 'Error: Sample project (sample_zephyr_project) appears not to have been built. '
	echo '       Please build sample_zephyr_project zephyr and try again.'
	exit
fi


#-------------------------------------------------------------------------------
#
# Copy tools
#
function copy_tool ()
{
	SRC_DIR=$1
	DST_DIR=$2

	echo Preparing $(basename "${SRC_DIR}")...
	if [ ! -d "${DST_DIR}" ]; then
		mkdir -p "${DST_DIR}"
	fi
	cp --recursive --update "${SRC_DIR}"/* ${DST_DIR}
} 

copy_tool "${ZEPHYR_TOOLKIT_SRC_DIR}"	"${ZEPHYR_TOOLKIT_DST_DIR}"
copy_tool "${NRFJPROG_SRC_DIR}"			"${NRFJPROG_DST_DIR}"
if [ ! -d "${GEN_ISR_TABLES_DST_DIR}" ]; then
	mkdir -p "${GEN_ISR_TABLES_DST_DIR}"

	#---------------------------------------------------------------------------
	#
	# build gen_isr_tables.exe
	#
	# Zephyr applications link in an unusual way. First they compile and 
	# pre-link the application with a dummy isr_table.c. Then they use a 
	# python script to generate the final isr_tables.c from the pre-linked 
	# image. This new isr_tables.c has to be compiled, before the second 
	# link pass can be completed. Instead of distributing the whole python 
	# install, here we just build an exe that is needed for generating 
	# isr_tables.c
	#
	echo Freezing gen_isr_tables...
	python -m PyInstaller	\
		--log-level WARN	\
		--distpath py_dist	\
		--noconfirm			\
		--paths ${ZEPHYRPROJECT_DIR}/.venv/Lib/site-packages/elftools/elf \
		--onefile ${ZEPHYRPROJECT_DIR}/zephyr/scripts/build/gen_isr_tables.py 
		
	cp py_dist/gen_isr_tables.exe ${GEN_ISR_TABLES_DST_DIR}/
	rm -rf build py_dist gen_isr_tables.spec
fi

# We don't need the whole arm-zephyr-eabi
rm -rf "${ZEPHYR_TOOLKIT_DST_DIR}"/include
rm -rf "${ZEPHYR_TOOLKIT_DST_DIR}"/picolibc
rm -rf "${ZEPHYR_TOOLKIT_DST_DIR}"/arm-zephyr-eabi/lib/thumb/nofp
rm -rf "${ZEPHYR_TOOLKIT_DST_DIR}"/arm-zephyr-eabi/lib/thumb/v6*
rm -rf "${ZEPHYR_TOOLKIT_DST_DIR}"/arm-zephyr-eabi/lib/thumb/v7*
rm -rf "${ZEPHYR_TOOLKIT_DST_DIR}"/arm-zephyr-eabi/lib/thumb/v8*+*
rm -rf "${ZEPHYR_TOOLKIT_DST_DIR}"/arm-zephyr-eabi/lib/thumb/v8*.base


#-------------------------------------------------------------------------------
# Usage: copy_headers <source_directory> <destination> [--recursive]
function copy_headers() 
{
	#echo "$1"

	mkdir -p "$2"
	cp $3 --update $1 "$2"
}


#-------------------------------------------------------------------------------
#
# Collect includes
#
echo Collecting headers...
DST_DIR=${HARDWARE_DIR}/inc

copy_headers ${SAMPLE_DIR}/build/zephyr/include/generated		"${DST_DIR}"		--recursive
copy_headers ${ZEPHYRPROJECT_DIR}/zephyr/include/zephyr				"${DST_DIR}"/zephyrproject/zephyr/include		--recursive
copy_headers ${ZEPHYRPROJECT_DIR}/zephyr/modules/cmsis/"*.h"			"${DST_DIR}"/zephyrproject/zephyr/modules/cmsis
copy_headers ${ZEPHYRPROJECT_DIR}/zephyr/soc/arm/nordic_nrf/nrf91/"*.h"			"${DST_DIR}"/zephyrproject/zephyr/soc/arm/nordic_nrf/nrf91
copy_headers ${ZEPHYRPROJECT_DIR}/zephyr/soc/arm/nordic_nrf/common/"*.h"			"${DST_DIR}"/zephyrproject/zephyr/soc/arm/nordic_nrf/common
copy_headers ${ZEPHYRPROJECT_DIR}/modules/lib/Arduino-Zephyr-API/cores/arduino	"${DST_DIR}"/zephyrproject/modules/lib/Arduino-Zephyr-API/cores		--recursive
copy_headers ${ZEPHYRPROJECT_DIR}/modules/lib/Arduino-Zephyr-API/variants/"*.h"	"${DST_DIR}"/zephyrproject/modules/lib/Arduino-Zephyr-API/variants
copy_headers ${ZEPHYRPROJECT_DIR}/modules/lib/Arduino-Zephyr-API/variants/nrf9160dk_nrf9160	"${DST_DIR}"/zephyrproject/modules/lib/Arduino-Zephyr-API/variants		--recursive
copy_headers ${ZEPHYRPROJECT_DIR}/modules/lib/Arduino-Zephyr-API/libraries/Wire/"*.h"			"${DST_DIR}"/zephyrproject/modules/lib/Arduino-Zephyr-API/libraries/Wire
copy_headers ${ZEPHYRPROJECT_DIR}/modules/hal/cmsis/CMSIS/Core/Include	"${DST_DIR}"/zephyrproject/modules/hal/cmsis/CMSIS/Core		--recursive
copy_headers ${ZEPHYRPROJECT_DIR}/modules/hal/nordic/nrfx/"*.h"	"${DST_DIR}"/zephyrproject/modules/hal/nordic/nrfx
copy_headers ${ZEPHYRPROJECT_DIR}/modules/hal/nordic/nrfx/mdk	"${DST_DIR}"/zephyrproject/modules/hal/nordic/nrfx		--recursive
copy_headers ${ZEPHYRPROJECT_DIR}/modules/hal/nordic/nrfx/hal	"${DST_DIR}"/zephyrproject/modules/hal/nordic/nrfx		--recursive
copy_headers ${ZEPHYRPROJECT_DIR}/modules/hal/nordic/nrfx/haly	"${DST_DIR}"/zephyrproject/modules/hal/nordic/nrfx		--recursive
copy_headers ${ZEPHYRPROJECT_DIR}/modules/hal/nordic/nrfx/drivers/"*.h"	"${DST_DIR}"/zephyrproject/modules/hal/nordic/nrfx/drivers/
copy_headers ${ZEPHYRPROJECT_DIR}/modules/hal/nordic/nrfx/drivers/include/"*.h"	"${DST_DIR}"/zephyrproject/modules/hal/nordic/nrfx/drivers/include
copy_headers ${ZEPHYRPROJECT_DIR}/zephyr/modules/hal_nordic/nrfx/"*.h"	"${DST_DIR}"/zephyrproject/zephyr/modules/hal_nordic/nrfx
copy_headers ${ZEPHYRPROJECT_DIR}/zephyr/lib/libc/minimal/include	"${DST_DIR}"/zephyrproject/zephyr/lib/libc/minimal		--recursive
copy_headers ${ZEPHYRPROJECT_DIR}/zephyr/include/zephyr/toolchain/zephyr_stdint.h	"${DST_DIR}"/zephyrproject/zephyr/include/zephyr/toolchain/

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
cp --update ${ZEPHYR_TOOLKIT_DST_DIR}/lib/gcc/arm-zephyr-eabi/12.2.0/thumb/v8-m.main/nofp/libgcc.a "${DST_DIR}"

rm -rf "${DST_DIR}"/libapp.a

# Collect linker command files
cp ${SAMPLE_DIR}/build/zephyr/linker.cmd				${DST_DIR}
cp ${SAMPLE_DIR}/build/zephyr/linker_zephyr_pre0.cmd	${DST_DIR}/linker_pre0.cmd




