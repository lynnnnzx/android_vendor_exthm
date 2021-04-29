#
# Copyright (C) 2018-2020 The LineageOS Project
#           (C) 2020-2021 The exTHmUI Project
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
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/exthm_arm.mk \
    $(LOCAL_DIR)/exthm_arm64.mk \
    $(LOCAL_DIR)/exthm_x86.mk \
    $(LOCAL_DIR)/exthm_x86_64.mk \
    $(LOCAL_DIR)/exthm_arm_ab.mk \
    $(LOCAL_DIR)/exthm_arm64_ab.mk \
    $(LOCAL_DIR)/exthm_x86_ab.mk \
    $(LOCAL_DIR)/exthm_x86_64_ab.mk \
    $(LOCAL_DIR)/exthm_tv_arm.mk \
    $(LOCAL_DIR)/exthm_tv_arm64.mk \
    $(LOCAL_DIR)/exthm_tv_x86.mk \
    $(LOCAL_DIR)/exthm_tv_x86_64.mk

COMMON_LUNCH_CHOICES := \
    exthm_arm-userdebug \
    exthm_arm64-userdebug \
    exthm_x86-userdebug \
    exthm_x86_64-userdebug \
    exthm_arm_ab-userdebug \
    exthm_arm64_ab-userdebug \
    exthm_x86_ab-userdebug \
    exthm_x86_64_ab-userdebug \
    exthm_tv_arm-userdebug \
    exthm_tv_arm64-userdebug \
    exthm_tv_x86-userdebug \
    exthm_tv_x86_64-userdebug

# Flatten APEXs for performance
OVERRIDE_TARGET_FLATTEN_APEX := true
