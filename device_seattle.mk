include device/qcom/msm7627a/msm7627a.mk

# init files
PRODUCT_COPY_FILES := \
  device/siragon/seattle/init/init.rc:root/init.rc \
  device/siragon/seattle/init/init.target.rc:root/init.target.rc \
  device/siragon/seattle/init/init.qcom.usb.rc:root/init.qcom.usb.rc \
  device/siragon/seattle/init/ueventd.rc:root/ueventd.rc \
  device/siragon/seattle/init/charger:root/charger \
  device/siragon/seattle/audio.conf:system/etc/bluetooth/audio.conf \
  device/siragon/seattle/gps.conf:system/etc/gps.conf \
  device/siragon/seattle/vold.fstab:system/etc/vold.fstab \
  device/siragon/seattle/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf
  
  
#blobs
$(call inherit-product-if-exists, vendor/siragon/seattle/vendor-blobs.mk)

# wifi modules
ifneq (linux,$(HOST_OS))
PRODUCT_COPY_FILES += \
  device/siragon/seattle/prebuilt/cfg80211.ko:system/lib/modules/ath6kl/cfg80211.ko \
  device/siragon/seattle/prebuilt/ath6kl_sdio.ko:system/lib/modules/ath6kl/ath6kl_sdio.ko
endif

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/siragon/seattle/seattle-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/siragon/seattle/overlay

LOCAL_PATH := device/siragon/seattle
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):prebuilt/kernel

$(call inherit-product, build/target/product/full.mk)

# Mozilla properties
PRODUCT_PROPERTY_OVERRIDES += \
  ro.moz.ril.simstate_extra_field=true \
  ro.moz.ril.emergency_by_default=true \
  ro.moz.ril.extra_int_2nd_call=true \
  sys.need.restart.rild=1 \
  ro.moz.omx.hw.max_width=854 \
  ro.moz.omx.hw.max_height=480 \
  ro.moz.fm.noAnalog=true

PRODUCT_PACKAGES += \
  librecovery \
  busybox

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_seattle
PRODUCT_DEVICE := seattle
PRODUCT_BRAND := qcom
PRODUCT_MANUFACTURER := siragon
PRODUCT_MODEL := sp-5000
