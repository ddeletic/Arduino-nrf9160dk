#!/bin/bash

RED='\x1b[31;01m'
GREEN='\x1b[32;01m'
YELLOW='\x1b[33;01m'
BOLD='\x1b[1m'
NORMAL='\x1b[0m'
HIGHLIGHT='\e[30;48;5;41m'


MY_DIR=$(realpath $(dirname $0))


#-------------------------------------------------------------------------------
#
# Check environment variables and required directories
#
if [ ! -d "${ZEPHYR_BASE}" ]; then
	echo -e ${RED}
	echo 'ERROR: Zephyr project directory cannot be found.'
	if [ -z ${ZEPHYR_BASE+x} ]; then 
		echo '       Variable ZEPHYR_BASE is not defined.'
		echo '      ' Please run \'source ./env.sh\'.
	else
		echo '       Variable ZEPHYR_BASE points to a non existent directory.'
		echo '       Check your Nordic SDK installation.'
	fi
	echo -e ${NORMAL}
	exit 1
fi
if [ ! -d "${ZEPHYR_SDK_INSTALL_DIR}" ]; then
	echo -e ${RED}
	echo 'ERROR: Zephyr SDK toolkit directory cannot be found.'
	if [ -z ${ZEPHYR_SDK_INSTALL_DIR+x} ]; then 
		echo '       Variable ZEPHYR_SDK_INSTALL_DIR is not defined.'
		echo '       Please run this script from a "nRF Connect SDK" bash terminal.'
	else
		echo '       Variable ZEPHYR_SDK_INSTALL_DIR points to a non existent directory.'
		echo '       This is serious. Complain to Dejan.'
	fi
	echo -e ${NORMAL}
	exit 1
else
	ZEPHYR_TOOLKIT_SRC_DIR=${ZEPHYR_SDK_INSTALL_DIR}/arm-zephyr-eabi
fi
if [ ! -d "${ZEPHYR_TOOLKIT_SRC_DIR}" ]; then
	echo -e ${RED}
	echo 'ERROR: Zephyr toolkit directory \(zephyr-sdk-x.y.z\arm-zephyr-eabi\) cannot be found.'
	echo '       Please run setup.sh and ensure it completes successfully.'
	echo -e ${NORMAL}
	exit 1
fi


#-------------------------------------------------------------------------------
#
# Ensure Arduino-Zephyr-API is visible to Zephyr
#
diff -qr -x .git Arduino-Zephyr-API/ $ZEPHYR_BASE/../modules/lib/Arduino-Zephyr-API 1>&2 > /dev/null
if [ $? != 0 ]; then
	cd "${ZEPHYR_BASE}/../modules/lib"
	rm -rf Arduino-Zephyr-API
	ln -s "${MY_DIR}/Arduino-Zephyr-API"
fi