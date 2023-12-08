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
# Create archives for distribution
#
PLATFORM_ARCHIVE_NAME=bosl_nrf9160dk_v${BOSL_VERSION}.tar.gz
GEN_ISR_TABLES_ARCHIVE_NAME=bosl_gen_isr_tables_v0.0.0.tar.gz
MERGEHEX_ARCHIVE_NAME=bosl_mergehex_v0.0.0.tar.gz
NRFJPROG_ARCHIVE_NAME=bosl_nrfjprog_v10.22.1.tar.gz
ARM_ZEPHYR_EABI_ARCHIVE_NAME=bosl_arm-zephyr-eabi_v12.2.0.tar.gz
GDB_ARCHIVE_NAME=arm-none-eabi-gdb_v13.2.90.tar.gz

cd ${MY_DIR}/bosl/hardware/nrf9160
echo Zipping bosl_nrf9160dk...
tar -czf ${MY_DIR}/dist/${PLATFORM_ARCHIVE_NAME} ${BOSL_VERSION}

cd ${MY_DIR}/bosl/tools/gen_isr_tables
echo Zipping gen_isr_tables...
tar -czf ${MY_DIR}/dist/${GEN_ISR_TABLES_ARCHIVE_NAME} 0.0.0

cd ${MY_DIR}/bosl/tools/mergehex
echo Zipping mergehex...
tar -czf ${MY_DIR}/dist/${MERGEHEX_ARCHIVE_NAME} 0.0.0

cd ${MY_DIR}/bosl/tools/nrfjprog
echo Zipping nrfjprog...
tar -czf ${MY_DIR}/dist/${NRFJPROG_ARCHIVE_NAME} 10.22.1

cd ${MY_DIR}/bosl/tools/arm-zephyr-eabi
echo Zipping arm-zephyr-eabi...
tar -czf ${MY_DIR}/dist/${ARM_ZEPHYR_EABI_ARCHIVE_NAME} 12.2.0

cd ${MY_DIR}/bosl/tools/gdb
echo Zipping gdb...
tar -czf ${MY_DIR}/dist/${GDB_ARCHIVE_NAME} 13.2.90


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


