#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/penang

# Inherit from motorola sm6375-common
include device/motorola/sm6375-common/BoardConfigCommon.mk

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := penang

# Kernel
BOARD_KERNEL_CMDLINE += androidboot.hab.product=penang
TARGET_KERNEL_CONFIG := vendor/penang_defconfig

TARGET_NO_KERNEL_OVERRIDE := true
TARGET_NO_KERNEL := false
BOARD_KERNEL_BINARIES := kernel
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)-kernel/dtbo.img
TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)-kernel/kernel
TARGET_KERNEL_CONFIG := holi_QGKI
TARGET_PREBUILT_DTB := $(DEVICE_PATH)-kernel/dtb.img
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)-kernel/dtb.img:$(TARGET_COPY_OUT)/dtb.img \
    $(DEVICE_PATH)-kernel/kernel:kernel \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)-kernel/ramdisk-modules/,$(TARGET_COPY_OUT_VENDOR_RAMDISK)/lib/modules) \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)-kernel/vendor-modules/,$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules)

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DEVICE_PATH)/device_framework_matrix.xml

# Partitions
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_SIZE := 4961861632 # ((SUPER_PARTITION_SIZE / 2) - 4194304)
BOARD_SUPER_PARTITION_SIZE := 4965011456

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 90

# Security
VENDOR_SECURITY_PATCH := 2024-06-01

# inherit from the proprietary version
include vendor/motorola/penang/BoardConfigVendor.mk
