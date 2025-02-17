#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/c2q

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo300

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a75

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := kona
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true


# Kernel - prebuilt
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_INCLUDE_RECOVERY_DTBO := true

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x02000000
BOARD_SECOND_OFFSET := 0x00000000
BOARD_KERNEL_TAGS_OFFSET := 0x01e00000
BOARD_DTB_OFFSET := 0x01f00000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_CMDLINE := console=null \
						androidboot.hardware=qcom \
						androidboot.memcg=1 \
						lpm_levels.sleep_disabled=1 \
						video=vfb:640x400,bpp=32,memsize=3072000 \
						msm_rtb.filter=0x237 \
						service_locator.enable=1 \
						androidboot.usbcontroller=a600000.dwc3 \
						swiotlb=2048 \
						printk.devkmsg=on \
						firmware_class.path=/vendor/firmware_mnt/image \
						loop.max_part=7 \
						androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION) \
						--kernel_offset $(BOARD_KERNEL_OFFSET) \
						--ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
						--second_offset $(BOARD_SECOND_OFFSET) \
						--tags_offset $(BOARD_KERNEL_TAGS_OFFSET) \
						--pagesize $(BOARD_KERNEL_PAGESIZE) \
						--dtb $(TARGET_PREBUILT_DTB) \
						--dtb_offset $(BOARD_DTB_OFFSET) \
						--board "SRPTC04B002"
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/c2q/bootimg.mk
BOARD_KERNEL_IMAGE_NAME := Image.gz

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 71303168 # 0x4400000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 86888448 # 0x52DD000
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
BOARD_ROOT_EXTRA_FOLDERS := cache carrier data_mirror efs keyrefuge linkerconfig omr optics prism spu
BOARD_SUPER_PARTITION_SIZE := 10817110016 # 0x284C00000
BOARD_SUPER_PARTITION_GROUPS := samsung_dynamic_partitions
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product odm
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := 10556088320 # 0x275312000

# Metadata
BOARD_USES_METADATA_PARTITION := true
BOARD_ROOT_EXTRA_FOLDERS += metadata

# System as root
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_SUPPRESS_SECURE_ERASE := true

# Crypto
TW_INCLUDE_CRYPTO := false
TW_INCLUDE_CRYPTO_FBE := false
TW_INCLUDE_FBE_METADATA_DECRYPT := false

# Platform
TARGET_BOARD_PLATFORM := kona
TARGET_BOARD_PLATFORM_GPU := qcom-adreno650
TARGET_USES_QCOM_HARDWARE := true
QCOM_BOARD_PLATFORMS += $(TARGET_BOARD_PLATFORM)

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_HAS_NO_SELECT_BUTTON := true
RECOVERY_SDCARD_ON_DATA := true

# Set FSTAB
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

# Security patch level
VENDOR_SECURITY_PATCH := 2021-08-01

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0


# TWRP Configuration
TW_DEVICE_VERSION := 0_xxvirus15
TW_THEME := portrait_hdpi
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_TWRPAPP := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TW_USE_TOOLBOX := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 128
TARGET_USES_MKE2FS := true
TW_NO_LEGACY_PROPS := true
TW_USE_NEW_MINADBD := true
TW_NO_SCREEN_BLANK := true
TW_EXCLUDE_APEX := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_CUSTOM_CLOCK_POS := 330
TW_NO_BIND_SYSTEM := true
TW_HAS_DOWNLOAD_MODE := true
TW_NO_REBOOT_BOOTLOADER := true

# Include some binaries
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true

# LOGCAT
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true​
