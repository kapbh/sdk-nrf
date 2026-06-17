#
# Copyright (c) 2022 Nordic Semiconductor ASA
#
# SPDX-License-Identifier: LicenseRef-Nordic-5-Clause
#

cmake_minimum_required(VERSION 3.20.0)

find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})
project(nrf_wifi_radio_test)

set(COMMON_RT_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../common)
target_include_directories(app PRIVATE ${COMMON_RT_DIR}/inc)

target_sources(app PRIVATE
  src/nrf_wifi_radio_test_main.c
  ${COMMON_RT_DIR}/src/nrf_wifi_radio_test_shell.c
  ${COMMON_RT_DIR}/src/nrf_wifi_radio_ficr_shell.c
  ${COMMON_RT_DIR}/src/ficr_prog.c
)

target_link_libraries(app PRIVATE nrf-wifi-osal)
