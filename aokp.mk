# Release name
PRODUCT_RELEASE_NAME := ThundercC

# Inherit some common stuff.
$(call inherit-product, vendor/aokp/configs/common_phone.mk)
$(call inherit-product, vendor/aokp/configs/cdma.mk)

#include qcom opensource features
$(call inherit-product, vendor/qcom/opensource/omx/mm-core/Android.mk)
$(call inherit-product, vendor/qcom/opensource/omx/mm-video/Android.mk)

# Inherit device configuration
$(call inherit-product, device/lge/thunderc/full_thunderc.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := thunderc
PRODUCT_NAME := aokp_thunderc
PRODUCT_BRAND := Android
PRODUCT_MODEL := LG-THUNDERC
PROUDCT_MANUFACTURER := LGE
PRODUCT_CHARACTERISTICS := phone
