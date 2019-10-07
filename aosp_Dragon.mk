# 
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o_mr1.mk)

# Inherit from Dragon device
$(call inherit-product, device/nokia/Dragon/device.mk)

# Inherit some common Lineageos stuff.
TARGET_GAPPS_ARCH := arm64
TARGET_BOOT_ANIMATION_RES := 1080
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)

# A/B updater
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier

# The following modules are included in debuggable builds only.
PRODUCT_PACKAGES_DEBUG += \
    bootctl \
    update_engine_client

# Boot control HAL
PRODUCT_PACKAGES += \
    bootctrl.sdm660

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.sdm660 \
    libcutils \
    libgptutils \
    libz

# Device identifiers
PRODUCT_NAME := aosp_Dragon
PRODUCT_BRAND := nokia
PRODUCT_DEVICE := Dragon
PRODUCT_MANUFACTURER := nokia
PRODUCT_MODEL := Nokia 6.1 Plus

PRODUCT_GMS_CLIENTID_BASE := android-nokia

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE="DRG_sprout" \
    PRODUCT_NAME="Dragon" \
    PRIVATE_BUILD_DESC="Dragon_00WW-user 9 PPR1.180610.011 00WW_3_54H release-keys"

BUILD_FINGERPRINT := Nokia/Dragon_00WW/DRG_sprout:9/PPR1.180610.011/00WW_3_54H:user/release-keys

TARGET_VENDOR := nokia
