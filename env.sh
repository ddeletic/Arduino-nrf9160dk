#!/bin/bash

#set -x
#set -e

declare -x ZEPHYR_TOOLCHAIN_VARIANT=zephyr
declare -x ZEPHYR_SDK_INSTALL_DIR=/c/ncs/toolchains/c57af46cb7/opt/zephyr-sdk
declare -x ZEPHYR_BASE=/c/ncs/v2.5.0/zephyr
declare -x ARDUINO_PATH=${HOME}/AppData/Local/Arduino15

export PATH=$PATH:${ZEPHYR_SDK_INSTALL_DIR}/../bin/Scripts

