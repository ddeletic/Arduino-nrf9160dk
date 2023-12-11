#!/bin/bash

RED='\x1b[31;01m'
GREEN='\x1b[32;01m'
YELLOW='\x1b[33;01m'
BOLD='\x1b[1m'
NORMAL='\x1b[0m'
HIGHLIGHT='\e[30;48;5;41m'

#-------------------------------------------------------------------------------
#
# Check if sourced or not
#
(return 0 2>/dev/null) 
if [ $? != 0 ]; then
    echo -e ${RED}
    echo [ERROR] This script must be run using 'source'. It cannot be executed.
    echo '       ' Please execute \'source $0\'
    echo -e ${NORMAL}
    exit
fi

#-------------------------------------------------------------------------------
#
# Setup environment variables
#
export ZEPHYR_TOOLCHAIN_VARIANT=zephyr
export ZEPHYR_SDK_INSTALL_DIR=/c/ncs/toolchains/c57af46cb7/opt/zephyr-sdk
export ZEPHYR_BASE=/c/ncs/v2.5.0/zephyr

export ARDUINO_PATH=${HOME}/AppData/Local/Arduino15

export PATH=$PATH:${ZEPHYR_SDK_INSTALL_DIR}/../bin/Scripts

export $(cat version.def)

echo -e ${GREEN}
echo The following variables have been set. If this does not match  
echo '    ' your setup, edit env.sh and source it again. Please do 
echo '    ' not commit changes to env.sh into git.
echo -e ${NORMAL}
echo 'ZEPHYR_BASE            =' ${ZEPHYR_BASE}
echo 'ZEPHYR_SDK_INSTALL_DIR =' ${ZEPHYR_SDK_INSTALL_DIR}
echo 'ARDUINO_PATH           =' ${ARDUINO_PATH}

 