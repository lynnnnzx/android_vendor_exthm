# Copyright (C) 2021 The exTHmUI Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

PRODUCT_VERSION_MAJOR = 12
PRODUCT_VERSION_MINOR = 0
PRODUCT_VERSION_MAINTENANCE := 0

ifeq ($(TARGET_VENDOR_SHOW_MAINTENANCE_VERSION),true)
    EXTHM_VERSION_MAINTENANCE := $(PRODUCT_VERSION_MAINTENANCE)
else
    EXTHM_VERSION_MAINTENANCE := 0
endif

ifeq ($(EXTHM_GAPPS),true)
    EXTHM_VERSION_GAPPS := Gapps
else
    EXTHM_VERSION_GAPPS := Vanilla
endif

# Set EXTHM_BUILDTYPE from the env RELEASE_TYPE, for jenkins compat

ifndef EXTHM_BUILDTYPE
    ifdef RELEASE_TYPE
        # Starting with "EXTHM_" is optional
        RELEASE_TYPE := $(shell echo $(RELEASE_TYPE) | sed -e 's|^EXTHM_||g')
        EXTHM_BUILDTYPE := $(RELEASE_TYPE)
    endif
endif

# Filter out random types, so it'll reset to UNOFFICIAL
ifeq ($(filter OFFICIAL,$(EXTHM_COMPILERTYPE)),)
    EXTHM_COMPILERTYPE :=
endif

# OFFICIAL_DEVICES
ifeq ($(EXTHM_COMPILERTYPE), OFFICIAL)
    LIST = $(shell cat vendor/exthm/exthm.devices)
    ifeq ($(filter $(EXTHM_BUILD), $(LIST)), $(EXTHM_BUILD))
        IS_OFFICIAL = true
        EXTHM_COMPILERTYPE := OFFICIAL
    endif
    ifneq ($(IS_OFFICIAL), true)
        EXTHM_COMPILERTYPE := UNOFFICIAL
        $(error Device is not phantasized "$(EXTHM_BUILD)")
    endif
endif

# Filter out random types, so it'll reset to SNAPSHOT
ifeq ($(filter RELEASE BETA ALPHA SNAPSHOT,$(EXTHM_BUILDTYPE)),)
    EXTHM_BUILDTYPE :=
endif

ifndef EXTHM_COMPILERTYPE
    # If EXTHM_COMPILERTYPE is not defined, set to UNOFFICIAL
    EXTHM_COMPILERTYPE := UNOFFICIAL
endif

ifndef EXTHM_BUILDTYPE
    # If EXTHM_BUILDTYPE is not defined, set to SNAPSHOT
    EXTHM_BUILDTYPE := SNAPSHOT
endif

ifdef EXTHM_EXTRAVERSION
    # Remove leading dash from EXTHM_EXTRAVERSION
    EXTHM_EXTRAVERSION := $(shell echo $(EXTHM_EXTRAVERSION) | sed 's/-//')
    # Add leading dash to EXTHM_EXTRAVERSION
    EXTHM_EXTRAVERSION := -$(EXTHM_EXTRAVERSION)
endif

ifeq ($(EXTHM_COMPILERTYPE), UNOFFICIAL)
    ifneq ($(TARGET_UNOFFICIAL_BUILD_ID),)
        EXTHM_EXTRAVERSION := -$(TARGET_UNOFFICIAL_BUILD_ID)
    endif
endif

EXTHM_BUILD_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)

ifneq ($(EXTHM_VERSION_MAINTENANCE),0)
    EXTHM_BUILD_VERSION := $(EXTHM_BUILD_VERSION).$(EXTHM_VERSION_MAINTENANCE)
endif

ifeq ($(EXTHM_BUILDTYPE), RELEASE)
    ifndef TARGET_VENDOR_RELEASE_BUILD_ID
        EXTHM_VERSION := $(EXTHM_BUILD_VERSION)$(PRODUCT_VERSION_DEVICE_SPECIFIC)-$(EXTHM_BUILD)-$(EXTHM_VERSION_GAPPS)
    else
        ifeq ($(TARGET_BUILD_VARIANT),user)
            EXTHM_VERSION := $(EXTHM_BUILD_VERSION)-$(TARGET_VENDOR_RELEASE_BUILD_ID)-$(EXTHM_BUILD)-$(EXTHM_VERSION_GAPPS)
        else
            EXTHM_VERSION := $(EXTHM_BUILD_VERSION)$(PRODUCT_VERSION_DEVICE_SPECIFIC)-$(EXTHM_BUILD)-$(EXTHM_VERSION_GAPPS)
        endif
    endif
else
    ifeq ($(EXTHM_VERSION_APPEND_TIME_OF_DAY),true)
        EXTHM_VERSION := $(EXTHM_BUILD_VERSION)-$(shell date -u +%Y%m%d_%H%M%S)-$(EXTHM_COMPILERTYPE)-$(EXTHM_BUILDTYPE)$(EXTHM_EXTRAVERSION)-$(EXTHM_BUILD)-$(EXTHM_VERSION_GAPPS)
    else
        EXTHM_VERSION := $(EXTHM_BUILD_VERSION)-$(shell date -u +%Y%m%d)-$(EXTHM_COMPILERTYPE)-$(EXTHM_BUILDTYPE)$(EXTHM_EXTRAVERSION)-$(EXTHM_BUILD)-$(EXTHM_VERSION_GAPPS)
    endif
endif

EXTHM_DISPLAY_VERSION := $(EXTHM_VERSION)

ifneq ($(PRODUCT_DEFAULT_DEV_CERTIFICATE),)
ifneq ($(PRODUCT_DEFAULT_DEV_CERTIFICATE),build/target/product/security/testkey)
    ifneq ($(EXTHM_BUILDTYPE), UNOFFICIAL)
        ifndef TARGET_VENDOR_RELEASE_BUILD_ID
            ifneq ($(EXTHM_EXTRAVERSION),)
                # Remove leading dash from EXTHM_EXTRAVERSION
                EXTHM_EXTRAVERSION := $(shell echo $(EXTHM_EXTRAVERSION) | sed 's/-//')
                TARGET_VENDOR_RELEASE_BUILD_ID := $(EXTHM_EXTRAVERSION)
            else
                TARGET_VENDOR_RELEASE_BUILD_ID := $(shell date -u +%Y%m%d)
            endif
        else
            TARGET_VENDOR_RELEASE_BUILD_ID := $(TARGET_VENDOR_RELEASE_BUILD_ID)
        endif
        EXTHM_DISPLAY_VERSION := $(EXTHM_BUILD_VERSION)-$(TARGET_VENDOR_RELEASE_BUILD_ID)-$(EXTHM_BUILD)-$(EXTHM_VERSION_GAPPS)
    endif
endif
endif

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.exthm.version=$(EXTHM_VERSION) \
  ro.exthm.releasetype=$(EXTHM_COMPILERTYPE) \
  ro.exthm.display.version=$(EXTHM_DISPLAY_VERSION) \
  ro.modversion=$(EXTHM_VERSION) \
  ro.exthm.build.code=KomakusaSannyo(駒草山如) \

