#!/bin/bash

MY_DIR=$(realpath $(dirname $0))

# Arduino-Zephyr-API (AZA)
AZA_SRC_DIR=${MY_DIR}/Arduino-Zephyr-API
AZA_DST_DIR=${ZEPHYR_BASE}/../modules/lib/

# ArduinoCore-API (ACA)
ACA_SRC_DIR=${MY_DIR}/ArduinoCore-API/api/
ACA_DST_DIR=${AZA_DST_DIR}/cores/arduino/

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
# Ensure environment is correct
#
if [ ! -d "${ZEPHYR_BASE}" ]; then
	echo 'ERROR: Zephyr project directory cannot be found.'
	if [ -z ${ZEPHYR_BASE+x} ]; then 
		echo '       Variable ZEPHYR_BASE is not defined.'
		echo '       Please run this script from a "nRF Connect SDK" bash terminal.'
	else
		echo '       Variable ZEPHYR_BASE points to a non existent directory.'
		echo '       Check your Nordic SDK installation.'
	fi
	exit 1
fi
if [ ! -f ${ZEPHYR_BASE}/west.yml ]; then
	echo  ERROR: File ${ZEPHYR_BASE}/west.yml cannot be found.
	echo '       Check your Nordic SDK installation.'
	exit 1
fi
if [ ! -d "${AZA_DST_DIR}" ]; then
	echo  ERROR: Destination directory \(${AZA_DST_DIR}\) cannot be found.
	echo '       Check your Nordic SDK installation.'
	exit 1
fi
if [ ! -d "${AZA_SRC_DIR}" ]; then
	echo  ERROR: Source directory \(${AZA_SRC_DIR}\) cannot be found.
	echo '       Ensure your BoslArduinoPackage and all git submodules are up-to-date.'
	exit 1
fi
if [ ! -d "${ACA_SRC_DIR}" ]; then
	echo  ERROR: Source directory \(${ACA_SRC_DIR}\) cannot be found.
	echo '       Ensure your BoslArduinoPackage and all git submodules are up-to-date.'
	exit 1
fi


#-------------------------------------------------------------------------------
#
# If Reinstall
#
cd ${ZEPHYR_BASE}
if [ ${REINSTALL} -ne 0 ]; then
	rm -rf "${AZA_DST_DIR}/Arduino-Zephyr-API"
	rm -rf "${ACA_DST_DIR}"
#	sed -i -e '/Arduino-Zephyr-API/,+3d' west.yml
fi

#-------------------------------------------------------------------------------
#
# Install
#
echo Installing Arduino-Zephyr-API to "${AZA_DST_DIR}"
cp --update --recursive "${AZA_SRC_DIR}" "${AZA_DST_DIR}"

echo Installing ArduinoCore-API to "${ACA_DST_DIR}"
mkdir -p "${ACA_DST_DIR}"
cp --update --recursive "${ACA_SRC_DIR}" "${ACA_DST_DIR}"

#-------------------------------------------------------------------------------
#
# Install pyelftools (required dependency)
#
pip install --user pyelftools




exit
# Below follows the old method of installing into zephyrproject rather than into nRF SDK










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
