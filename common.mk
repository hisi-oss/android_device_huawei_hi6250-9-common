#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

## Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.2-service \
    android.hardware.graphics.mapper@2.0-impl

PRODUCT_PACKAGES += \
    libion

PRODUCT_PACKAGES += \
    libui-v28

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1.vendor

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service \
    android.hardware.gatekeeper@1.0-impl

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-service

PRODUCT_PACKAGES += \
    libkeymaster3device.vendor \
    libkeystore-engine-wifi-hidl \
    libkeystore-wifi-hidl

# Log
PRODUCT_PACKAGES += \
    libhwlog \
    libxcollie

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.hi6250 \
    fstab.hi6250_ramdisk \
    fstab.modem \
    init.hi6250.rc \
    init.hi6250.usb.rc \
    init.override.rc \
    ueventd.hi6250.rc

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/rootdir/etc/connectivity/,$(TARGET_COPY_OUT_VENDOR)/etc/init/connectivity)

# Recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.recovery.hi6250.rc:$(TARGET_RECOVERY_OUT)/root/init.recovery.hi6250.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/hisi

# Inherit the proprietary files
$(call inherit-product, vendor/huawei/hi6250-9-common/hi6250-9-common-vendor.mk)
