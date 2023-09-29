# Arduino-nrf9160dk

This project aims to provide Arduino Board Support Package (BSP) for Nordic nRF9160dk board (https://www.nordicsemi.com/Products/Development-hardware/nrf9160-dk). One of the main goals is to harness the power of Zephyr RTOS (https://www.zephyrproject.org/) that is available for this board, and adapt it in a way that less experienced users can write, download and run Arduino sketches on nRF9160dk.

Currently the BSP only supports Windows Arduino host, as well as Windows as development host.

## Board Support Package Overview

The Board Support Package (BSP) comprises:
- Platform definition required for Arduino (see https://arduino.github.io/arduino-cli/0.34/platform-specification/)
- Header files and libraries required to build Arduino sketches
- Tools required to compile, link and download sketches to the board
Creating a working BSP relies on libraries precompiled on Zephyr, as well as Zephyr SDK.

## Prerequisites

Before the BSP can be built, several prerequisites have to be met:
- Nordic command line tools (https://www.nordicsemi.com/Products/Development-tools/nRF-Command-Line-Tools) have to be installed on the host machine, preferably in it's default location (C:\Program Files\Nordic Semiconductor\nrf-command-line-tools).
- Zephyr has to be installed on the host machine.
- arduino-zephyr-api (https://github.com/zephyrproject-rtos/gsoc-2022-arduino-core) has to be added to the Zephyr install.
- ArduinoCore-API (https://github.com/arduino/ArduinoCore-API) has to be added to arduino-zephyr-api

Once all these have been successfully installed, the project in `sample_zephyr_project` directory has to be successfully built.

And finally, a version of Linux command line shell for Windows (e.g. GitBash) is necessary to build the BSP.

## Board Support Package Generation

Preparing the components of the BSP, should be relatively straight forward, once the prerequisites have been met. 

1. Edit `prepare_package.sh` and adjust ZEPHYRPROJECT_DIR, ZEPHYR_TOOLKIT_SRC_DIR and NRFJPROG_SRC_DIR variables to reflect installation paths on your system
2. Execute `prepare_package.sh`. This will collect all the necessary headers and libraries, as well as tools required into the required directory structure.
3. Execute `mk_dist.sh`. This will generate a JSON file and a number of .tar.gz archives ready for distribution, and place them into `dist` directory.

## Board Support Package Distribution

### Local

If you only want to test the BSP on your local machine:

- Execute `local_install.sh`
- (re)Start Arduino IDE
- In Arduino IDE, go to the board manager, search for 'bosl' and install the offered package.
- Build, download, run sketch
  
### Public

If you need to publish the BSP: 

- Copy .tar.gz files to a location on the internet where others will be able to download from.
- Adjust the paths to these files in the JSON file
- Copy the JSON file to a location on the internet
- Publish the link to the JSON
- Users need to add the link to JSON in their Arduino IDE Preferences, under 'Additional boards manager URLs'
