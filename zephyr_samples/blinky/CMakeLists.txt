# SPDX-License-Identifier: Apache-2.0

cmake_minimum_required(VERSION 3.20.0)

cmake_path(SET ZephyrBase $ENV{ZEPHYR_BASE})
set(DTC_OVERLAY_FILE ${ZephyrBase}/../modules/lib/Arduino-Zephyr-API/variants/${BOARD}/${BOARD}.overlay)
set(ZEPHYR_EXTRA_MODULES ${ZephyrBase}/../modules/lib/Arduino-Zephyr-API)

#message(----------"${ZEPHYR_EXTRA_MODULES}"-----------)

find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})
project(blinky)

target_sources(app PRIVATE blinky.cpp)

zephyr_compile_options(-Wno-unused-variable -Wno-comment)



