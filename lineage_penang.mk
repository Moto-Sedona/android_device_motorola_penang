#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from penang device
$(call inherit-product, device/motorola/penang/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_penang
PRODUCT_DEVICE := penang
PRODUCT_MANUFACTURER := motorola
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g53 5G

TARGET_BUILD_GAPPS := true

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    DeviceProduct=penang_g \
    BuildDesc=$(call normalize-path-list, "penang_g-user 14 U1TP34M.29-83-9 05314 release-keys")

BUILD_FINGERPRINT := motorola/penang_g/penang:14/U1TP34M.29-83-9/05314:user/release-keys
