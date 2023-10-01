# Maintenance

This project depends on three upstream projects which are under very active development. When things upstream change, they may (and will) affect us. This document describes how to keep up with those changes.

## Compilation

When compilation in Arduino fails, the following recipe applies:

- in sample_zephyr_project/build/compile_commands.json find the command that builds app.cpp
- ensure this command works from command line
- copy the failed command from Arduino (getting the command displayed requires 'Preferences :: 
show verbose output during :: Compilation' to be set).
- identify differences between the two commands. This will most likely require several iterations of changing the latter command until it succeeds.
- modify platform.txt and/or prepare_package.sh accordingly

## Linking

When linking in Arduino fails, the following recipe applies:

- in zephyr_project/build/zephyr, delete zephyr.*
- in zephyr_project/build/ run `ninja --verbose`
- compare the linker command with the one that fails in Arduino. 
- modify platform.txt and/or prepare_package.sh accordingly

## Build process

Zephyr application build process comprises two stage linking. If this changes, we will nave to adjust the linking process in platform.txt and perhaps tools used (gen_isr_tables may need to be updated or other tools added). This is likely to be quite involved, but clues can be picked up from `ninja --verbose`
