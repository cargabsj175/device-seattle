## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := seattle

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/siragon/seattle/device_seattle.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := seattle
PRODUCT_NAME := cm_seattle
PRODUCT_BRAND := siragon
PRODUCT_MODEL := seattle
PRODUCT_MANUFACTURER := siragon
