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
- A version of Linux command line shell for Windows (e.g. GitBash) is necessary to build the BSP.
- Python + Pyinstaller
- Optionally, for quick and easy testing, Arduino Command line tool is required (download from https://arduino.github.io/arduino-cli/0.35/installation/#latest-release)
- Only for v1.0.0  of this package, which has now been made obsolete, the following tools are required: CMake, 7zip and Devicetree compiler. See https://docs.zephyrproject.org/latest/develop/getting_started/index.html for details.


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
  
### Publish

If you need to publish the BSP: 

- Copy .tar.gz files to a location on the internet where others will be able to download from.
- Adjust the paths to these files in the JSON file
- Copy the JSON file to a location on the internet
- Publish the link to the JSON
- Add the JSON URL to 'Arduino IDE :: File :: Preferences :: Additional boards manager URLs'


## Installing the BSP

Once the BSP has been published, users have to add path to the json file to the list of additional packafe locations in Arduino preferences under 'Additional boards manager URLs'. This can be:

* a local file (e.g. [file:///C:/Users/%USERNAME%/Documents/bosl/dist/package_bosl_nrf9160dk_index.json]()) 
* an URL (e.g. https://github.com/ddeletic/arduino_bosl_nrf9160dk_downloads/raw/main/package_bosl_nrf9160dk_index.json)

Open the Board Manager and search for 'bosl'. Only one result will come up. Install (upgrade or remove) the BSP and have fun. 


## Debugging

Nordic nrf9160dk board comes with an integrated 'Segger J-Link' debugging probe. Therefore no additional hardware is required for debugging code on the board. Debugging support from Arduino IDE is still under development.

NOTE: Tools for building the package expect the debugger executable (arm-none-eabi-gdb) to be present and will issue a warning if not found. The debugger must be downloaded separately as it is too big to include in the repository.

### Prerequisites

In order for the Arduino debugger to see the J-Link, 'Segger JLink GDB Server' is required. This software cannot be distributed with this package due to licensing terms, but is free to download from [https://www.segger.com/downloads/jlink/]().

When installing J-Link Software, ensure it is installed to the default location: **"C:\Program Files\SEGGER\JLink"**.

**NOTE:** Installing J-Link software to the default location is essential since Arduino does not support J-Link natively (in fact it actively ignores references to J-Link), and so the package uses Arduino's 'debug_custom.json' feature to direct the IDE towards the server. 

### How to debug

For successful debugging, a file named 'debug_custom.json' must be placed in the sketch directory, next to the .ino file. Creating of this file cannot be automated (yet). The contrents of this file must be as follows:
```
{
    "name": "BoSL nrf9160",
    "serverpath": "C:/Program Files/SEGGER/JLink/JLinkGDBServerCL.exe",
    "device": "nrf9160"
}
```

Arduino IDE (as of v2.2.1) starts up with the last sketch open and last board pre-selected. If the last board was BoSL nrf9160dk, then the **Start Debugging** button on the main toolbar is always disabled. In order to enable debugging, this button has to be re-enabled. To do so:

* Select a different board from 'Tools :: Board' 
* Select BoSL nrf9160 board again (from 'Tools :: Board')

With debug_custom.json in place and the **Start Debugging** button enabled, click on the button. This will 

* Open the debugging side bar
* If everything is setup correctly, the debugging configurations drop-down list will contain 'BoSL nrf9160' configuration, and it will be pre-selected. 
* The little green 'Start Debugging' button to the left of the drop-down list will be enabled.
* In the background, Arduino will have made a temporary directory similar to "C:\Users\<username>\AppData\Local\Temp\arduino-ide2-d5ca121d10a1326dd2c3e59d44c1b18f", and created a file named launch.json in there.

Once launch.json has been created, debugging can proceed without following the steps above. However, the procedure must be repeated for every sketch needing debugging. 

