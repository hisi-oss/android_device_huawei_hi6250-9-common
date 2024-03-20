#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

COMMON_PATH := device/huawei/hi6250-9-common

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Boot
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_HAS_RAMDISK := false
BOARD_CUSTOM_BOOTIMG_MK := hardware/huawei/mkbootimg.mk

BOARD_KERNEL_BASE := 0x00478000
BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := loglevel=4 coherent_pool=512K page_tracker=on slub_min_objects=12 unmovable_isolate1=2:192M,3:224M,4:256M printktimer=0xfff0a000,0x534,0x538 androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=recovery
BOARD_KERNEL_CMDLINE += androidboot.super_partition=system
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x0ff88000 --second_offset 0x00e88000 --tags_offset 0x07988000

# Bluetooth
BOARD_USES_LIBBT_WRAPPER := true

# Build System
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Filesystems
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Init
TARGET_INIT_VENDOR_LIB := //hardware/hisi:init_hisi
TARGET_RECOVERY_DEVICE_MODULES := init_hisi

# Kernel
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64

TARGET_KERNEL_CONFIG := merge_hi6250_defconfig
TARGET_KERNEL_SOURCE := kernel/huawei/hi6250-9

TARGET_KERNEL_CLANG_VERSION := r416183b
TARGET_KERNEL_CLANG_PATH := $(abspath .)/prebuilts/clang/kernel/$(HOST_PREBUILT_TAG)/clang-$(TARGET_KERNEL_CLANG_VERSION)
TARGET_KERNEL_LLVM_BINUTILS := false
TARGET_KERNEL_ADDITIONAL_FLAGS := HOSTCFLAGS="-fuse-ld=lld -Wno-unused-command-line-argument"

# Partitions
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor

# Partitions - dynamic
BOARD_SUPER_PARTITION_BLOCK_DEVICES := cust eng_system eng_vendor odm patch preas preavs product system vendor
BOARD_SUPER_PARTITION_CUST_DEVICE_SIZE := 201326592
BOARD_SUPER_PARTITION_ENG_SYSTEM_DEVICE_SIZE := 12582912
BOARD_SUPER_PARTITION_ENG_VENDOR_DEVICE_SIZE := 12582912
BOARD_SUPER_PARTITION_ODM_DEVICE_SIZE := 134217728
BOARD_SUPER_PARTITION_PATCH_DEVICE_SIZE := 33554432
BOARD_SUPER_PARTITION_PREAS_DEVICE_SIZE := 1182793728
BOARD_SUPER_PARTITION_PREAVS_DEVICE_SIZE := 33554432
BOARD_SUPER_PARTITION_PRODUCT_DEVICE_SIZE := 981467136
BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE := 3909091328
BOARD_SUPER_PARTITION_VENDOR_DEVICE_SIZE := 822083584

BOARD_SUPER_PARTITION_SIZE := 6299844608
BOARD_SUPER_PARTITION_GROUPS := huawei_dynamic_partitions
BOARD_HUAWEI_DYNAMIC_PARTITIONS_PARTITION_LIST := odm product system system_ext vendor
BOARD_HUAWEI_DYNAMIC_PARTITIONS_SIZE := $(shell expr $(BOARD_SUPER_PARTITION_SIZE) - 4194304)
BOARD_SUPER_PARTITION_METADATA_DEVICE := system

# Platform
TARGET_BOARD_PLATFORM := hi6250

# Properties
TARGET_VENDOR_PROP += $(COMMON_PATH)/vendor.prop

# Recovery
BOARD_USES_FULL_RECOVERY_IMAGE := true
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/rootdir/etc/fstab.hi6250
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := hardware/huawei/releasetools

# RIL
BOARD_PROVIDES_LIBRIL := true
BOARD_USES_LIBRIL_WRAPPER := true
ENABLE_VENDOR_RIL_SERVICE := true

# Root
BOARD_ROOT_EXTRA_FOLDERS += \
    3rdmodem \
    3rdmodemnvm \
    3rdmodemnvmbkp \
    modem_log \
    sec_storage \
    splash2

# SELinux
include device/hisi/sepolicy/SEPolicy.mk

# Vintf
DEVICE_MANIFEST_FILE := $(COMMON_PATH)/manifest.xml

# VNDK
PRODUCT_USE_VNDK_OVERRIDE := true

# Wifi
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Inherit the proprietary files
include vendor/huawei/hi6250-9-common/BoardConfigVendor.mk
