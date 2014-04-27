USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/siragon/seattle/BoardConfigVendor.mk

#Optimizations
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60
COMMON_GLOBAL_CFLAGS += -DMISSING_GRALLOC_BUFFERS
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_HAVE_TSLIB := true
ARCH_ARM_HAVE_NEON := true
TARGET_USES_OVERLAY := false
TARGET_HAVE_BYPASS  := false
TARGET_USES_C2D_COMPOSITION := false
TARGET_QCOM_HDMI_OUT := false
BOARD_USE_SKIA_LCDTEXT := true
USE_OPENGL_RENDERER := true

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := unknown
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_BOOTLOADER_BOARD_NAME := seattle

TARGET_PREBUILT_KERNEL := device/siragon/seattle/prebuilt/kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom loglevel=1
BOARD_KERNEL_BASE := 0x00200000
BOARD_KERNEL_PAGESIZE := 4096

# Recovery
ENABLE_LIBRECOVERY := true

# librecovery
RECOVERY_EXTERNAL_STORAGE := /emmc

# filesystem
SYSTEM_FS_TYPE            := ext4
SYSTEM_PARTITION_TYPE     := EMMC
SYSTEM_LOCATION           := /dev/block/mmcblk0p12

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_FLASH_BLOCK_SIZE := 131072

# hack to prevent llvm from building
BOARD_USE_QCOM_LLVM_CLANG_RS := true

BOARD_HAS_NO_SELECT_BUTTON := true
