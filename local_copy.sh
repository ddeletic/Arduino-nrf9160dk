#!/bin/bash

RED='\x1b[31;01m'
GREEN='\x1b[32;01m'
YELLOW='\x1b[33;01m'
BOLD='\x1b[1m'
NORMAL='\x1b[0m'
HIGHLIGHT='\e[30;48;5;41m'

#set -x
#-------------------------------------------------------------------------------
#
# Command line parameters
#
REINSTALL=0
STAGING=0
while [[ $# -gt 0 ]]; do
	case $1 in
		-q|--quick)
			QUICK=1
			shift # past argument
		;;
		-r|--reinstall)
			REINSTALL=1
			shift # past argument
		;;
		-s|--staging)
			STAGING=1
			shift # past argument
		;;
		-h|--help)
			echo Usage: $(basename $0) [options]
			echo -e '       '-q, --quick    \\t\\t quick, do not copy tools
			echo -e '       '-r, --reinstall\\t\\t remove previous install
			echo -e '       '-s, --staging  \\t\\t copy built distribution to local 
			echo -e '       '               \\t\\t\\t Arduino staging area
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
if [ ${REINSTALL} -eq 0 ]; then
	# Only copy the hardware part, and skip tools 
	PACKAGE_PATH=bosl/hardware/nrf9160/${BOSL_VERSION}
else
	PACKAGE_PATH=bosl/
fi
if [ -z ${ARDUINO_PATH+x} ]; then 
	echo -e ${YELLOW}
	echo This shell is missing essential environment variables.
	echo I shall set them up for this run, but it is best if you 
	echo executed 'source ./env.sh' yourself.
	echo -e ${NORMAL}
	source ${MY_DIR}/env.sh
fi
DST_PATH=${ARDUINO_PATH}/packages/${PACKAGE_PATH}




#-------------------------------------------------------------------------------
#
# Copy to local Arduino package area for immediate use
#
cd ${MY_DIR}/${PACKAGE_PATH}

if [ ${REINSTALL} -ne 0 ]; then
	rm -rf ${DST_PATH}
	mkdir -p ${DST_PATH}
fi

echo -e ${GREEN}Copying BoSL package into Arduino package area.${NORMAL}
cp --recursive * ${DST_PATH}


#-------------------------------------------------------------------------------
#
# Copy distribution to Arduino's staging area as if it had been downloaded
#
if [ ${STAGING} -ne 0 ]; then
	cd ${MY_DIR}/dist

	echo -e ${GREEN}Copying BoSL distribution into Arduino staging area.${NORMAL}
	cp *.json /c/Users/${USERNAME}/AppData/Local/Arduino15
	cp *.tar.gz /c/Users/${USERNAME}/AppData/Local/Arduino15/staging/packages/
fi
