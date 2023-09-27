@echo off

set MY_DIR=%~dp0

pushd bosl\hardware\nrf9160
echo Zipping bosl_nrf9160dk...
tar.exe -a -cf %MY_DIR%\dist\bosl_nrf9160dk_v1.0.0.zip *
popd

pushd bosl\tools\gen_isr_tables\
echo Zipping gen_isr_tables...
tar.exe -a -cf %MY_DIR%\dist\gen_isr_tables_v0.0.0.zip *
popd

pushd bosl\tools\nrfjprog\
echo Zipping nrfjprog...
tar.exe -a -cf %MY_DIR%\dist\nrfjprog_v10.22.1.zip *
popd

pushd bosl\tools\arm-zephyr-eabi\
echo Zipping arm-zephyr-eabi...
tar.exe -a -cf %MY_DIR%\dist\arm-zephyr-eabi_v12.2.0.zip *
popd

