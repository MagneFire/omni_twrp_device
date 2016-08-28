# inherit from the proprietary version
-include vendor/huawei/sturgeon/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := msm8226
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := krait
ARCH_ARM_HAVE_NEON  := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

# Krait optimizations
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_PLD_SET := true
TARGET_KRAIT_BIONIC_PLDOFFS := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH := 64
TARGET_KRAIT_BIONIC_PLDSIZE := 64

TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := sturgeon

BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive androidboot.hardware=sturgeon user_debug=31 maxcpus=4 msm_rtb.filter=0x3F console=null pm_levels.sleep_disabled=1  androidboot.console=null
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
BOARD_KERNEL_BASE := 0x0000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x0008000 --ramdisk_offset 0x2000000 --second_offset 0x0f00000 --tags_offset 0x01E00000

TARGET_KERNEL_SOURCE := kernel/huawei/sturgeon
TARGET_KERNEL_CONFIG := sturgeon_omni_defconfig

BOARD_BOOTIMAGE_PARTITION_SIZE := 23068672
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 23068672
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 3258974208
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_HAS_NO_REAL_SDCARD := true

PRODUCT_COPY_FILES += device/huawei/sturgeon/fstab.sturgeon:root/fstab.sturgeon \
    device/huawei/sturgeon/init.recovery.sturgeon.rc:root/init.recovery.sturgeon.rc

TARGET_RECOVERY_FSTAB := device/huawei/sturgeon/twrp.fstab

TARGET_RECOVERY_QCOM_RTC_FIX := true

#TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

RECOVERY_SDCARD_ON_DATA := true
#RECOVERY_GRAPHICS_FORCE_USE_LINELENGTH := true

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

TARGET_USES_LOGD := true

# TWRP Specific
TWRP_INCLUDE_LOGCAT := true
TW_USE_NEW_MINADBD := true
TW_NEW_ION_HEAP := true
TW_TARGET_USES_QCOM_BSP := true
TW_CUSTOM_THEME := device/huawei/sturgeon/watch_mdpi
TW_ROUND_SCREEN := true
TW_NO_USB_STORAGE := true
TW_NO_EXFAT := true
TW_NO_EXFAT_FUSE := true
TW_INCLUDE_JPEG := true
TW_INCLUDE_FB2PNG := true
TW_INCLUDE_CRYPTO := true
TW_EXCLUDE_MTP := true
TW_EXCLUDE_SUPERSU := true
