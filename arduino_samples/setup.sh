#!/bin/bash

if [ -e $(dirname $0)/arduino-cli.exe ]; then
	ARDUINO_CLI_PATH=./arduino-cli.exe
else
	where arduino-cli.exe > nul
	if [ $? == 0 ]; then
		ARDUINO_CLI_PATH=./arduino-cli.exe
	else
		echo [ERROR] arduino-cli.exe must be in this directory or in system path
		exit
	fi
fi


${ARDUINO_CLI_PATH} config init
# Config file written to: ${HOME}/AppData/Local/Arduino15/arduino-cli.yaml

${ARDUINO_CLI_PATH} core list
# Check if bosl:nrf9160 is installed

# If not, add 'file:///C:/Users/Dejan/Documents/Dev/bosl/BoslArduinoPackage/dist/package_bosl_nrf9160dk_index.json'
# to the config file above into 
#	board_manager:
#		additional_urls:

${ARDUINO_CLI_PATH} core update-index
${ARDUINO_CLI_PATH} core install bosl:nrf9160
# to install/update BoSL platform


