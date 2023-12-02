# Maintenance

This project depends on three upstream projects (Nordic SDK, Arduino-Zephyr-API, and ArduinoCore-API) which are under very active development. When things upstream change, they may (and will) affect us. This document describes how to keep up with those changes. Or rather, how to get from zero to Arduino (i.e. how to regenerate the package, based on the state of the three upstream dependencies).

# Building from source

The current state of the source files on the 'master' branch has been setup with the 'Nordic nRF SDK' installed into `C:\ncs`, version used is v2.5.0. 

All tools for building the package are bash scripts. Building has to be done from a bash shell under windows (e.g. git-bash). Several environment variables need to be set up. They are given in `env.sh`. Best to source this script every time the shell is started.

    ** STEP 1: source ./env.sh **

Build `zephyr_samples/at_client` project. This is necessary, as we will use libraries created during this process as a basis for Arduino builds.

    ** STEP 2: make z **

The build the board support package. 

    ** STEP 3: make pack **

Create a distribution

    ** STEP 3: make dist **

## Testing

In order to quickly test the package, it can be copied into the Arduino packages area and used to build arduino sample sketches:

    ** STEP 1: ./local_copy.sh **

Sample sketches can be built in the Arduino IDE, or from command line. For the latter, `arduino-cli.exe` must be visible in the path or be placed into `arduino_samples` directory. After that, building is simple: 

    ** STEP 2: cd arduino_samples && make **


# Package Building Process

The package has to provide all tools (compilers, linkers, hex file creators and manipulators, etc), as well as all the include files and libraries necessary to compile, link, and post-process a sketch. 

Additionally, it has to provide all rules on how to use these toles during the build process.

Compilers and executables are stored in `bosl/tools` while rules are in `bosl/hardware/nrf9160/x.y.z/*.txt`. Include files are in `bosl/hardware/nrf9160/x.y.z/inc` while link libraries are in `bosl/hardware/nrf9160/x.y.z/lib`.

There are makefiles with simple targets scattered throughout this package that can aid with individual steps of building, testing and distributing the package.

## Compilation

For successfull compilation, we need to identify all include paths the compiler uses, as well as all the compiler options and defined macros. The best way to do this is to build a zephyr sample, and then look at the command ninja used to compile a c or cpp file. These can be found in the `build/compile_commands.json` once the sample had been built.

All compile macros, options, include files have to be carefully transferred over into `bosl/hardware/nrf9160/x.y.z/platform.txt` into the relevant compiler rules. Also, mk_package has to be updated accordingly in order to ensure all relevant include files are in the package. 

## Linking

For successfull linking, we need to identify all libraries and objects included by the linker, as well as all the linker options and defined macros. In the already built zephyr sample, delete `build/zephyr/zephyr.*` and run `ninja --verbose -b keeprsp`.

All link macros, options, and libraries used have to be carefully transferred over into `bosl/hardware/nrf9160/x.y.z/platform.txt` into the relevant linker rules. Also, mk_package has to be updated accordingly in order to ensure all relevant link libraries are in the package. 

### isr_table.c

Zephyr applications use an unusual linking process, in that they build a preliminary elf file, which is then used to generate isr_tables.c (using a python script). This c file is then compiled and used to link the final elf. These steps have to be incorporated into Arduino link process, via the postlink hooks. 

Additionally, we have to freeze the python script into an exe and add it as a toolchain tool. This is done by mk_package.sh and this can be used as a template for for adding other tools. E.g. mergehex needed for post processing below.

## Post Process

The linker builds an elf file which has to be transformed into a hex for the programmer to flash the board. This transformation involves several steps which include objcopy, and mergehex. Identifying these steps can be done in the same way as when identifying the link command. 

All steps have to be carefully transferred over into `bosl/hardware/nrf9160/x.y.z/platform.txt` into the relevant elf2hex rules and post objcopy hooks. 

Additionally, the post process steps may include running python scripts (mergehex). The best way to transfer these into arduino is to freeze python scripts into exe files (in mk_package.sh) and distribute as such.

### TODO

A lot of these steps could/should be automated. Especially the recepies for compiling, linking and post processing. Some clues on how to get from zero-to-arduino can be found in `zephyr_samples/at_client/commands`.







## Troubleshooting

### Compile

When compilation in Arduino fails, the following recipe applies:

- in sample_zephyr_project/build/compile_commands.json find the command that builds app.cpp
- ensure this command works from command line
- copy the failed command from Arduino (getting the command displayed requires 'Preferences :: 
show verbose output during :: Compilation' to be set).
- identify differences between the two commands. This will most likely require several iterations of changing the latter command until it succeeds.
- modify platform.txt and/or mk_package.sh accordingly

### Link

When linking in Arduino fails, the following recipe applies:

- in zephyr_project/build/zephyr, delete zephyr.*
- in zephyr_project/build/ run `ninja --verbose`
- compare the linker command with the one that fails in Arduino. 
- modify platform.txt and/or prepare_package.sh accordingly

