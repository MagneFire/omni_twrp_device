# inherit from the proprietary version
#-include vendor/motorola/smelt/BoardConfigVendor.mk
DEVICE_TREE := device/motorola/smelt

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

TARGET_BOOTLOADER_BOARD_NAME := smelt

# Boot image
BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=smelt utags.blkdev=/dev/block/platform/msm_sdcc.1/by-name/utags utags.backup=/dev/block/platform/msm_sdcc.1/by-name/utagsBackup user_debug=31 msm_rtb.filter=0x3
#BOARD_KERNEL_IMAGE_NAME := zImage-dtb
BOARD_KERNEL_BASE := 0x0000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x0008000 --ramdisk_offset 0x2000000 --second_offset 0x0f00000 --tags_offset 0x01E00000

TARGET_PREBUILT_KERNEL := $(DEVICE_TREE)/zImage-dtb

#TARGET_KERNEL_SOURCE := kernel
TARGET_KERNEL_CONFIG := smelt_defconfig

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 23068672
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 23068672
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 3258974208
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_HAS_NO_REAL_SDCARD := true

PRODUCT_COPY_FILES += \
    firmware/image/atmxt-r3.tdat:root/firmware/image/atmxt-r3.tdat \
    firmware/image/atmxt-r3_hybrid.tdat:root/firmware/image/atmxt-r3_hybrid.tdat \
    firmware/image/atmxt-r3_large.tdat:root/firmware/image/atmxt-r3_large.tdat \
    firmware/image/atmxt-r3_small.tdat:root/firmware/image/atmxt-r3_small.tdat \
    init.recovery.smelt.rc:root/init.recovery.smelt.rc

TARGET_RECOVERY_FSTAB := twrp.fstab

TARGET_RECOVERY_QCOM_RTC_FIX := true

TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

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
#TW_CUSTOM_THEME := watch_mdpi
TW_ROUND_SCREEN := true
TW_NO_USB_STORAGE := true
TW_NO_EXFAT := true
TW_NO_EXFAT_FUSE := true
TW_INCLUDE_JPEG := true
TW_INCLUDE_FB2PNG := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := false
TW_EXCLUDE_MTP := true
TW_EXCLUDE_SUPERSU := true
ARCH_ARM_HAVE_NEON := true