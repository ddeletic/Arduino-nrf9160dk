#!/bin/bash


#set -x

MY_DIR=$(realpath $(dirname $0))


BOSL_VERSION=1.0.0
PACKAGE_PATH=bosl/hardware/nrf9160/${BOSL_VERSION}
ARDUINO_PATH=${HOME}/AppData/Local/Arduino15

cd ${MY_DIR}/${PACKAGE_PATH}

cp --recursive * ${ARDUINO_PATH}/packages/${PACKAGE_PATH}
