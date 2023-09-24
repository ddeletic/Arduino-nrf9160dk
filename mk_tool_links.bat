@echo off

set MY_DIR=%~dp0

:: NOTE: This batch uses (sometimes restricted) mklink command
::		 to create symbolic links to directories with large amounts
::		 of data. If mklink is restricted, copy of the whole source 
::		 tree into destination, will achieve the same effect, at the 
::		 expense of disk space

:: NOTE: The two symlinks depend on the sources being located in 
::		 specific locations. The first (nrf-command-line-tools) should
::		 not be a problem as they are normally installed at the expected 
::		 location.
::
::		 The first one (arm-zephyr-eabi), is normally unzipped, from an 
::		 sdk archive, and both the location and the sdk version may need 
::		 adjusting. For location, adjust the pushd command, and for the
::		 version, adjust TOOLKIT_PATH. 

pushd %MY_DIR%..\
set TOOLKIT_PATH=%cd%\zephyr-sdk-0.16.1\arm-zephyr-eabi
popd

if not exist %MY_DIR%\bosl\tools\arm-zephyr-eabi\share (
	mklink /d %MY_DIR%\bosl\tools\arm-zephyr-eabi\share %TOOLKIT_PATH%
)

set NRFJPROG_PATH="C:\Program Files\Nordic Semiconductor\nrf-command-line-tools"

if not exist %MY_DIR%\bosl\tools\nrfjprog\share (
	mklink /d %MY_DIR%\bosl\tools\nrfjprog\share %NRFJPROG_PATH%
)
