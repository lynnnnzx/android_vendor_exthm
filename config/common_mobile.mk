# Inherit common mobile Lineage stuff
$(call inherit-product, vendor/exthm/config/common.mk)

# Default notification/alarm sounds
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.config.notification_sound=Argon.ogg \
    ro.config.alarm_alert=Hassium.ogg

ifneq ($(TARGET_BUILD_VARIANT),user)
# Thank you, please drive thru!
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.dun.override=0
endif

# Optional packages
PRODUCT_PACKAGES += \
    LiveWallpapersPicker \
    PhotoTable

# AOSP packages
PRODUCT_PACKAGES += \
    Email \
    ExactCalculator \
    Exchange2

# Lineage packages
PRODUCT_PACKAGES += \
    AudioFX \
    Backgrounds \
    Jelly \
    LockClock \
    Profiles \
    TrebuchetQuickStep \
    WeatherProvider

# Custom exTHmUI packages
PRODUCT_PACKAGES += \
    APlayer

# exTHmUI Theme
PRODUCT_PACKAGES += \
    DefaultTheme

# MiPush
ifneq ($(WITHOUT_MIPUSH),true)
PRODUCT_PACKAGES += \
    MiPushManager \
    MiPushService
ifeq ($(WITH_MIPUSH_PROP),true)
    PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
        ro.miui.ui.version.name = V10 \
        ro.miui.ui.version.code = 8 \
        ro.miui.version.code_time = 1544025600 \
        ro.fota.oem = Xiaomi \
        ro.miui.internal.storage = /sdcard/
endif
endif

# Accents
PRODUCT_PACKAGES += \
    LineageBlackTheme \
    LineageDarkTheme \
    LineageBlackAccent \
    LineageBlueAccent \
    LineageBrownAccent \
    LineageCyanAccent \
    LineageGreenAccent \
    LineageOrangeAccent \
    LineagePinkAccent \
    LineagePurpleAccent \
    LineageRedAccent \
    LineageYellowAccent

# Extra accents
ifeq ($(EXTRA_ACCENTS),true)

# Accents from crDroid
PRODUCT_PACKAGES += \
    Amber \
    BlueGrey \
    DeepOrange \
    DeepPurple \
    Grey \
    Indigo \
    LightBlue \
    LightGreen \
    Lime \
    Teal \
    White

# Brand Accents from crDroid
PRODUCT_PACKAGES += \
    AospaGreen \
    AndroidOneGreen \
    CocaColaRed \
    DiscordPurple \
    FacebookBlue \
    InstagramCerise \
    JollibeeCrimson \
    MonsterEnergyGreen \
    NextbitMint \
    OneplusRed \
    PepsiBlue \
    PocophoneYellow \
    RazerGreen \
    SamsungBlue \
    SpotifyGreen \
    StarbucksGreen \
    TwitchPurple \
    TwitterBlue \
    XboxGreen \
    XiaomiOrange
endif

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Custom off-mode charger
ifeq ($(WITH_LINEAGE_CHARGER),true)
PRODUCT_PACKAGES += \
    lineage_charger_res_images \
    font_log.png \
    libhealthd.lineage
endif

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# FOD
ifeq ($(EXTRA_FOD_ANIMATIONS),true)
DEVICE_PACKAGE_OVERLAYS += vendor/exthm/overlay/fod
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/exthm/overlay/fod
endif
