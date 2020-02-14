# Inherit mini common exTHm stuff
$(call inherit-product, vendor/exthm/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

$(call inherit-product, vendor/exthm/config/telephony.mk)
