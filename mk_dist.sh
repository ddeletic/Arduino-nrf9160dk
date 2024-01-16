#!/bin/bash


MY_DIR=$(realpath $(dirname $0))


#-------------------------------------------------------------------------------
#
# Setup
#
if [ ! -d ${MY_DIR}/dist ]; then
	mkdir dist
fi


#-------------------------------------------------------------------------------
#
# Version numbers for individual archives. These may cange in the future
#
GEN_ISR_TABLES_VERSION=0.0.0
MERGEHEX_VERSION=0.0.0
NRFJPROG_VERSION=10.22.1
TOOLCHAIN_VERSION=12.2.0
GDB_VERSION=13.2.90


#-------------------------------------------------------------------------------
#
# Create archives for distribution
#
PLATFORM_ARCHIVE_NAME=bosl_nrf9160dk_v${BOSL_VERSION}.tar.gz
GEN_ISR_TABLES_ARCHIVE_NAME=bosl_gen_isr_tables_v${GEN_ISR_TABLES_VERSION}.tar.gz
MERGEHEX_ARCHIVE_NAME=bosl_mergehex_v${MERGEHEX_VERSION}.tar.gz
NRFJPROG_ARCHIVE_NAME=bosl_nrfjprog_v${NRFJPROG_VERSION}.tar.gz
ARM_ZEPHYR_EABI_ARCHIVE_NAME=bosl_arm-zephyr-eabi_v${TOOLCHAIN_VERSION}.tar.gz
GDB_ARCHIVE_NAME=arm-none-eabi-gdb_v${GDB_VERSION}.tar.gz

cd ${MY_DIR}/bosl/hardware/nrf9160
echo Zipping bosl_nrf9160dk...
tar -czf ${MY_DIR}/dist/${PLATFORM_ARCHIVE_NAME} ${BOSL_VERSION}

cd ${MY_DIR}/bosl/tools/gen_isr_tables
echo Zipping gen_isr_tables...
tar -czf ${MY_DIR}/dist/${GEN_ISR_TABLES_ARCHIVE_NAME} ${GEN_ISR_TABLES_VERSION}

cd ${MY_DIR}/bosl/tools/mergehex
echo Zipping mergehex...
tar -czf ${MY_DIR}/dist/${MERGEHEX_ARCHIVE_NAME} ${MERGEHEX_VERSION}

cd ${MY_DIR}/bosl/tools/nrfjprog
echo Zipping nrfjprog...
tar -czf ${MY_DIR}/dist/${NRFJPROG_ARCHIVE_NAME} ${NRFJPROG_VERSION}

cd ${MY_DIR}/bosl/tools/arm-zephyr-eabi
echo Zipping arm-zephyr-eabi...
tar -czf ${MY_DIR}/dist/${ARM_ZEPHYR_EABI_ARCHIVE_NAME} ${TOOLCHAIN_VERSION}

cd ${MY_DIR}/bosl/tools/arm-none-eabi-gdb
echo Zipping gdb...
tar -czf ${MY_DIR}/dist/${GDB_ARCHIVE_NAME} ${GDB_VERSION}


#-------------------------------------------------------------------------------
function write_archive_data () 
{
	NAME=$1
	SRC_FILE=$2
	DST_FILE=$3

	ARCHIVE_FILENAME=$(basename ${SRC_FILE})
	ARCHIVE_SIZE=$(ls -l ${SRC_FILE} | cut -d ' ' -f 5)
	ARCHIVE_CHECKSUM=$(md5sum ${SRC_FILE} | cut -d ' ' -f 1)

	sed -i	-e "s/__${NAME}_ARCHIVE_FILENAME__/${ARCHIVE_FILENAME}/" \
			-e "s/__${NAME}_ARCHIVE_SIZE__/${ARCHIVE_SIZE}/" \
			-e "s/__${NAME}_ARCHIVE_CHECKSUM__/${ARCHIVE_CHECKSUM}/" \
			-e "s/x_y_z/${BOSL_VERSION}/" \
			${DST_FILE}
}


#-------------------------------------------------------------------------------
#
# Populate json
#
echo Creating json...
JSON_FNAME=package_bosl_nrf9160dk_index.json
cp ${MY_DIR}/templates/${JSON_FNAME}.template	${MY_DIR}/dist/${JSON_FNAME}


write_archive_data PLATFORM			${MY_DIR}/dist/${PLATFORM_ARCHIVE_NAME}			${MY_DIR}/dist/${JSON_FNAME}
write_archive_data GEN_ISR_TABLES	${MY_DIR}/dist/${GEN_ISR_TABLES_ARCHIVE_NAME}	${MY_DIR}/dist/${JSON_FNAME}
write_archive_data MERGEHEX			${MY_DIR}/dist/${MERGEHEX_ARCHIVE_NAME}			${MY_DIR}/dist/${JSON_FNAME}
write_archive_data NRFJPROG			${MY_DIR}/dist/${NRFJPROG_ARCHIVE_NAME}			${MY_DIR}/dist/${JSON_FNAME}
write_archive_data ARM_ZEPHYR_EABI	${MY_DIR}/dist/${ARM_ZEPHYR_EABI_ARCHIVE_NAME}	${MY_DIR}/dist/${JSON_FNAME}
write_archive_data GDB				${MY_DIR}/dist/${GDB_ARCHIVE_NAME}				${MY_DIR}/dist/${JSON_FNAME}


