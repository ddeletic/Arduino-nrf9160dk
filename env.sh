#!/bin/bash

# NOTE: This script must be run via 'source' not just executed


export ZEPHYR_TOOLCHAIN_VARIANT=zephyr
export ZEPHYR_SDK_INSTALL_DIR=/c/ncs/toolchains/c57af46cb7/opt/zephyr-sdk
export ZEPHYR_BASE=/c/ncs/v2.5.0/zephyr

export ARDUINO_PATH=${HOME}/AppData/Local/Arduino15

export PATH=$PATH:${ZEPHYR_SDK_INSTALL_DIR}/../bin/Scripts

export $(cat version.def)
