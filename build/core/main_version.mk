# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# exTHmUI System Version

ADDITIONAL_BUILD_PROPERTIES += \
    ro.exthm.version=$(EXTHM_VERSION) \
    ro.exthm.releasetype=$(EXTHM_BUILDTYPE) \
    ro.exthm.build.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.modversion=$(EXTHM_VERSION) \
    ro.exthm.device=$(EXTHM_BUILD) \
    ro.exthmlegal.url=https://exthmui.cn/legal.html

# exTHmUI Platform Display Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.exthm.display.version=$(EXTHM_DISPLAY_VERSION)

# LineageOS Platform SDK Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.lineage.build.version.plat.sdk=$(LINEAGE_PLATFORM_SDK_VERSION)

# LineageOS Platform Internal Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.lineage.build.version.plat.rev=$(LINEAGE_PLATFORM_REV)
