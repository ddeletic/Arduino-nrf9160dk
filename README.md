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
- CMake, Python, 7zip and Devicetree compiler are required. See https://docs.zephyrproject.org/latest/develop/getting_started/index.html for details.
- A version of Linux command line shell for Windows (e.g. GitBash) is necessary to build the BSP.

## Setup (once only)

Run `setup.sh` and ensure it completes successfully. This will:
- download and setup Zephyr SDK (compiler, linker, etc)
- download and setup Zephyr and all required modules
- build `sample_zephyr_project`

It may be a good idea to have a good, healthy meal at this point as setup performs a lot of downloading and setting up. Just be aware that it may prompt for answers here and there.

When it completes successfully, it will display Memory Usage for the built sample_zephyr_project app.

## Board Support Package Generation

1. Execute `prepare_package.sh`. This will collect all the necessary headers and libraries, as well as tools required into the required directory structure (and place them into `bosl` directory).
2. Execute `mk_dist.sh`. This will generate a JSON file and a number of .tar.gz archives ready for distribution, and place them into `dist` directory.

## Board Support Package Distribution

### Local

If you only want to test the BSP on your local machine:

- If 'BoSL nRF9160dk' BSP had been installed in Arduino, remove it
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
