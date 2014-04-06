$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Release name
PRODUCT_RELEASE_NAME := seattle

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/siragon/seattle/seattle-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/siragon/seattle/overlay

LOCAL_PATH := device/siragon/seattle
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):prebuilt/kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_seattle
PRODUCT_DEVICE := seattle
PRODUCT_BRAND := qcom
PRODUCT_MANUFACTURER := siragon
PRODUCT_MODEL := sp-5000
