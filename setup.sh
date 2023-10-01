#!/bin/bash

MY_DIR=$(realpath $(dirname $0))

#-------------------------------------------------------------------------------
# See https://docs.zephyrproject.org/latest/develop/getting_started/index.html
# for details and prerequisites. As a minimum, CMake, Python and Devicetree compiler
# must be installed and up to date.
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
#
# Install Zephyr SDK
#
ZEPHYR_TOOLKIT_SRC_DIR=${MY_DIR}/zephyr-sdk-0.16.3/arm-zephyr-eabi
if [ ! -d "${ZEPHYR_TOOLKIT_SRC_DIR}" ]; then
	cd ${MY_DIR}
    if [ ! -f ${MY_DIR}/zephyr-sdk-0.16.3_windows-x86_64.7z ]; then
		wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.16.3/zephyr-sdk-0.16.3_windows-x86_64.7z
	fi
	7z x zephyr-sdk-0.16.3_windows-x86_64.7z
	cd zephyr-sdk-0.16.3
	cmd.exe /c setup.cmd
fi

#-------------------------------------------------------------------------------
#
# Install and update Zephyr
#
if [ ! -d zephyrproject ]; then
	cd ${MY_DIR}
	python -m venv zephyrproject/.venv
	. zephyrproject/.venv/Scripts/activate
	pip install west
	west init zephyrproject
	cd zephyrproject
	west update
	west zephyr-export
	pip install -r zephyr/scripts/requirements.txt

	# Add Arduino-Zephyr-API module
	cd ${MY_DIR}/zephyrproject
	sed -i -e 's!^\([ \t]*- name: bsim\)$!    - name: Arduino-Zephyr-API\n      path: modules/lib/Arduino-Zephyr-API\n      revision: next\n      url: https://github.com/ddeletic/gsoc-2022-arduino-core\n\1!' zephyr/west.yml
	west update


	cp -r ${MY_DIR}/ArduinoCore-API/api/ ${MY_DIR}/zephyrproject/modules/lib/Arduino-Zephyr-API/cores/arduino/
fi

#-------------------------------------------------------------------------------
#
# Build sample-zephyr-project
#
cd ${MY_DIR}/zephyrproject
west build -p always -b nrf9160dk_nrf9160 -d ../sample_zephyr_project/build ../sample_zephyr_project/
