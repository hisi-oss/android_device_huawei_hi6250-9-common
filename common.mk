#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

## Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Connectivity
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/rootdir/etc/connectivity/,$(TARGET_COPY_OUT_VENDOR)/etc/init/connectivity)

# ConfigStore
PRODUCT_PACKAGES += \
    disable_configstore

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

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-service

PRODUCT_PACKAGES += \
    libkeymaster3device.vendor \
    libkeystore-engine-wifi-hidl \
    libkeystore-wifi-hidl

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

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
    hardware/hisi \
    hardware/huawei

# Task profiles
PRODUCT_COPY_FILES += \
    system/core/libprocessgroup/profiles/cgroups_28.json:$(TARGET_COPY_OUT_VENDOR)/etc/cgroups.json \
    system/core/libprocessgroup/profiles/task_profiles_28.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json

# Inherit the proprietary files
$(call inherit-product, vendor/huawei/hi6250-9-common/hi6250-9-common-vendor.mk)
