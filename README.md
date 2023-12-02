# Arduino-nrf9160dk

This project aims to provide Arduino Board Support Package (BSP) for Nordic nRF9160dk board (https://www.nordicsemi.com/Products/Development-hardware/nrf9160-dk). One of the main goals is to harness the power of Zephyr RTOS (https://www.zephyrproject.org/) that is available for this board, and adapt it in a way that less experienced users can write, download and run Arduino sketches on nRF9160dk.

Currently the BSP only supports Windows Arduino host, as well as Windows as development host.

## Overview

The Board Support Package (BSP) comprises:
- Platform definition required for Arduino (see https://arduino.github.io/arduino-cli/0.34/platform-specification/)
- Header files and libraries required to build Arduino sketches
- Tools required to compile, link, post process and download sketches to the board
Creating a working BSP relies on libraries precompiled by the Nordic nRF SDK.

## Prerequisites

Before the BSP can be built, several prerequisites have to be met:
- Nordic nRF SDK, preferably in the default location (C:\ncs\). Tested with v2.5.0.
- Nordic command line tools (https://www.nordicsemi.com/Products/Development-tools/nRF-Command-Line-Tools) have to be installed on the host machine, preferably in the default location (C:\Program Files\Nordic Semiconductor\nrf-command-line-tools).
- CMake, Python, 7zip and Devicetree compiler may be required if not included in the nRF SDK. See https://docs.zephyrproject.org/latest/develop/getting_started/index.html for details.
- A version of Linux command line shell for Windows (e.g. GitBash) is necessary to build the BSP.
- Optionally, for quick and easy testing, Arduino Command line tool is required (download from https://arduino.github.io/arduino-cli/0.35/installation/#latest-release)

## Board Support Package Generation

Quick steps:

1. Open a GitBash shell
2. `source ./env.sh`
3. `make z`
4. `make pack`
5. `make dist`

See Maintenance.md for details. 

### Testing

Arduino sketches can be created an dtested in Arduino IDE, but a quick way to test the BSP is to run `make build_arduino`.

## Distribution

### Local

If you only want to test the BSP on your local machine:

- If 'BoSL nRF9160dk' BSP had been installed in Arduino, remove it
- Exit Arduino IDE
- Execute `make copy`
- Restart Arduino IDE
- Build, download, run sketch
  
### Public

If you need to publish the BSP: 

- Copy .tar.gz files to a location on the internet where others will be able to download from.
- Adjust the paths to these files in the JSON file
- Copy the JSON file to a location on the internet
- Publish the link to the JSON

## Installing the BSP

Once the BSP has been published, users have to add path to the json file to the list of additional packafe locations in Arduino preferences under 'Additional boards manager URLs'. This can be:

* a local file (e.g. [file:///C:/Users/%USERNAME%/Documents/bosl/dist/package_bosl_nrf9160dk_index.json]()) 
* an URL (e.g. https://github.com/ddeletic/arduino_bosl_nrf9160dk_downloads/raw/main/package_bosl_nrf9160dk_index.json)

Open the Board Manager and search for 'bosl'. Only one result will come up. Install (upgrade or remove) the BSP and have fun. 


