#!/bin/bash

# Assuming we are running in git-bash on Windows
MY_DIR=$(realpath $(dirname $0))
cd ${MY_DIR}


if [ -e ./arduino-cli.exe ]; then
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

echo Building blinky
${ARDUINO_CLI_PATH} compile --fqbn bosl:nrf9160:nrf9160dk blinky/blinky.ino
echo
echo
#echo Building modem_at_client
#${ARDUINO_CLI_PATH} compile --fqbn bosl:nrf9160:nrf9160dk modem_at_client/modem_at_client.ino
