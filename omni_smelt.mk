# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Release name
PRODUCT_RELEASE_NAME := smelt


# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit device configuration
#$(call inherit-product, device/lge/bass/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := smelt
PRODUCT_NAME := omni_smelt
PRODUCT_BRAND := Motorola
PRODUCT_MODEL := Moto 360
PRODUCT_MANUFACTURER := Motorola
