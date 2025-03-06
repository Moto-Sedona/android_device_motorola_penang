#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

TARGET_HAS_FM := true

# Boot animation
TARGET_SCREEN_HEIGHT := 1200
TARGET_SCREEN_WIDTH := 720

# Screen
TARGET_SCREEN_DENSITY := 280

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 280dpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

PRODUCT_SHIPPING_API_LEVEL := 30

# Inherit from motorola sm6375-common
$(call inherit-product, device/motorola/sm6375-common/common.mk)

# Enable Virtual A/B
TARGET_IS_VAB := true

# Soong
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Overlays
PRODUCT_PACKAGES += \
    FrameworksResPenang \
    LineageSystemUIPenang \
    SettingsResPenang \
    NfcResPenang \
    SystemUIResPenang \
    RegulatoryInfoOverlayXT2335-5

PRODUCT_PACKAGES += \
    FrameworksResPenangSB \
    RegulatoryInfoOverlayXT2335-4

PRODUCT_PACKAGES += \
    RegulatoryInfoOverlayXT2335-1 \
    RegulatoryInfoOverlayXT2335-2 \
    RegulatoryInfoOverlayXT2335-3

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_ext_spkr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_ext_spkr.conf \
    $(LOCAL_PATH)/audio/audio_io_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_io_policy.conf \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

# Charger
WITH_LINEAGE_CHARGER := true

# Felica
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/felica_sb,$(TARGET_COPY_OUT_PRODUCT)/etc/felica_sb)

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1.vendor \
    com.motorola.hardware.biometric.fingerprint@1.0.vendor

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/idc/uinput-fpc.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-fpc.idc \
    $(LOCAL_PATH)/configs/idc/uinput-fpsensor.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-fpsensor.idc \
    $(LOCAL_PATH)/configs/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/configs/keylayout/uinput-fpsensor.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpsensor.kl

# Init
$(foreach f,$(wildcard $(LOCAL_PATH)/rootdir/etc/init/hw/*.rc),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/$(notdir $f)))
$(foreach f,$(wildcard $(LOCAL_PATH)/rootdir/etc/init/*.rc),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/etc/init/$(notdir $f)))
$(foreach f,$(wildcard $(LOCAL_PATH)/rootdir/bin/*.sh),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/bin/$(notdir $f)))

# The default value of this variable is false and should only be set to true when
# the device allows users to retain eSIM profiles after factory reset of user data.
PRODUCT_PRODUCT_PROPERTIES += \
    masterclear.allow_retain_esim_profiles_after_fdr=true

# IPACM
PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml \
    libipanat \
    liboffloadhal

# IPC router config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service \
    android.hardware.nfc@1.2.vendor \
    android.hardware.secure_element@1.2.vendor \
    com.android.nfc_extras \
    libchrome.vendor \
    NfcNci \
    SecureElement \
    Tag

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfc/libnfc-nci_SN100.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-mtp-SN100.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf

# Recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/init.recovery.penang.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.penang.rc \
    $(LOCAL_PATH)/recovery/root/load_ts_firmware.sh:$(TARGET_COPY_OUT_RECOVERY)/root/load_ts_firmware.sh

# SKU
# Variant Properties
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,product.*.prop,$(LOCAL_PATH)/configs/props/sku/,$(TARGET_COPY_OUT_PRODUCT))

# Inherit from vendor blobs
$(call inherit-product, vendor/motorola/penang/penang-vendor.mk)
