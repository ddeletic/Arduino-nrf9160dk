#!/bin/bash


#set -x
#-------------------------------------------------------------------------------
#
# Command line parameters
#
REINSTALL=0
while [[ $# -gt 0 ]]; do
	case $1 in
		-r|--reinstall)
			REINSTALL=1
			shift # past argument
		;;
		-h|--help)
			echo Usage: $(basename $0) [options]
			echo -e '       '-r, --reinstall\\t\\t remove previous install
			exit
		;;
		-*|--*)
			echo "Unknown option $1"
			exit 1
		;;
	esac
done


#-------------------------------------------------------------------------------
#
# Setup paths and variables
#
MY_DIR=$(realpath $(dirname $0))


BOSL_VERSION=1.0.0
PACKAGE_PATH=bosl/hardware/nrf9160/${BOSL_VERSION}
ARDUINO_PATH=${HOME}/AppData/Local/Arduino15
DST_PATH=${ARDUINO_PATH}/packages/${PACKAGE_PATH}




cd ${MY_DIR}/${PACKAGE_PATH}

if [ ${REINSTALL} -ne 0 ]; then
	rm -rf ${DST_PATH}
	mkdir -p ${DST_PATH}
fi

cp --recursive * ${DST_PATH}
