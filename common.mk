#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/hisi \
    hardware/huawei

# Inherit the proprietary files
$(call inherit-product, vendor/huawei/hi6250-9-common/hi6250-9-common-vendor.mk)
