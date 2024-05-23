# Copyright (c) 2024 Nordic Semiconductor ASA
# SPDX-License-Identifier: LicenseRef-Nordic-5-Clause

# B0 will boot the app directly, create the DFU zip with both update candidates
include(${ZEPHYR_NRF_MODULE_DIR}/cmake/fw_zip.cmake)

sysbuild_get(app_fw_info_firmware_version IMAGE ${DEFAULT_IMAGE} VAR CONFIG_FW_INFO_FIRMWARE_VERSION KCONFIG)

generate_dfu_zip(
  OUTPUT ${PROJECT_BINARY_DIR}/dfu_application.zip
  BIN_FILES ${PROJECT_BINARY_DIR}/signed_by_b0_${DEFAULT_IMAGE}.bin ${PROJECT_BINARY_DIR}/signed_by_b0_s1_image.bin
  TYPE application
  SCRIPT_PARAMS
  "signed_by_b0_${DEFAULT_IMAGE}.binload_address=$<TARGET_PROPERTY:partition_manager,PM_S0_ADDRESS>"
  "signed_by_b0_s1_image.binload_address=$<TARGET_PROPERTY:partition_manager,PM_S1_ADDRESS>"
  "version_B0=${app_fw_info_firmware_version}"
  DEPENDS
  ${DEFAULT_IMAGE}_extra_byproducts
  ${DEFAULT_IMAGE}_signed_kernel_hex_target
  s1_image_extra_byproducts
  s1_image_signed_kernel_hex_target
  )