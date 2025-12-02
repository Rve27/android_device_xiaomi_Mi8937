#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_n_mr1.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Kernel
TARGET_KERNEL_VERSION := 4.19

# Inherit from Mi8937 device
TARGET_DISABLE_EPPE := true
$(call inherit-product, device/xiaomi/Mi8937/device.mk)

# Maintainer
AXION_MAINTAINER := Rve

# Blur effect
TARGET_ENABLE_BLUR := false

# CPU
PERF_GOV_SUPPORTED := true
PERF_DEFAULT_GOV := schedutil
PERF_ANIM_OVERRIDE := false

# GPU
GPU_FREQS_PATH := /sys/class/kgsl/kgsl-3d0/freq_table_mhz
GPU_MIN_FREQ_PATH := /sys/class/kgsl/kgsl-3d0/min_clock_mhz

# High Brightness Mode (HBM)
HBM_SUPPORTED := true

# Flashlight strength
TORCH_STR_SUPPORTED := false

# doze fix
# for devices with doze/sensor related issues 
TARGET_NEEDS_DOZE_FIX := false

# Charging
BYPASS_CHARGE_SUPPORTED := false

# [experimental] userspace simple lmk trial version 
# of https://github.com/kerneltoast/android_kernel_google_gs201/blob/16.0.0-sultan/drivers/android/simple_lmk.c ©kerneltoast
# Targets devices with prebuilt kernels or uslmk support across kernels
TARGET_USES_USLMK := false

# do not enable TARGET_IS_LOW_RAM if your device ram is greater than 4gb
# else OOM will most likely occur on operations where applications and camera can fill heap limit
# e.g uploading video/media on apps with camera preview
# this is a mitigation targets legacy devices 4gb below
# Using quicken is a trade-off: here we trade clean pages for dirty pages,
# extra cpu and battery. That's because the quicken files will be jit-ed in all
# the processes that load of shared apk and the code cache is not shared.
# Some notable apps that will be affected by this are gms and chrome.
TARGET_IS_LOW_RAM := true

# BCR
TARGET_PREBUILT_BCR := false

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage

PRODUCT_PACKAGES += \
    xiaomi_prada_overlay_lineage \
    xiaomi_riva_overlay_lineage \
    xiaomi_rolex_overlay_lineage \
    xiaomi_ulysse_overlay_lineage \
    xiaomi_wt8937_overlay_lineage

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := Mi8937_4_19
PRODUCT_NAME := lineage_Mi8937_4_19
BOARD_VENDOR := Xiaomi
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := MSM8937
PRODUCT_MANUFACTURER := Xiaomi
TARGET_VENDOR := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="land-user 6.0.1 MMB29M V10.2.2.0.MALMIXM release-keys"
    BuildFingerprint=Xiaomi/land/land:6.0.1/MMB29M/V10.2.2.0.MALMIXM:user/release-keys
