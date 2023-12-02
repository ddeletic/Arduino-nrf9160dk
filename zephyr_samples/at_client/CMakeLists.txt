cmake_minimum_required(VERSION 3.20.0)

cmake_path(SET ZephyrBase $ENV{ZEPHYR_BASE})
set(DTC_OVERLAY_FILE ${ZephyrBase}/../modules/lib/Arduino-Zephyr-API/variants/${BOARD}/${BOARD}.overlay)
set(ZEPHYR_EXTRA_MODULES ${ZephyrBase}/../modules/lib/Arduino-Zephyr-API)

find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})
project(at_client)

target_sources(app PRIVATE at_client.cpp)
