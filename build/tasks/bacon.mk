# Copyright (C) 2017 Unlegacy-Android
#           (C) 2017 The LineageOS Project
#           (C) 2020 The exTHmUI Project
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

# -----------------------------------------------------------------
# exTHm OTA update package

EXTHM_TARGET_PACKAGE := $(PRODUCT_OUT)/exthm-$(EXTHM_VERSION).zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

.PHONY: bacon
bacon: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(EXTHM_TARGET_PACKAGE)
	$(hide) $(SHA256) $(EXTHM_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(EXTHM_TARGET_PACKAGE).sha256sum
	@echo "Package Complete: $(EXTHM_TARGET_PACKAGE)" >&2
	@echo -e ${CL_CYN}""${CL_RST}
	@echo -e ${CL_CYN}"\033[31m=======================================================================================\033[0m"${CL_RST}
	@echo -e ${CL_CYN}""${CL_RST}
	@echo -e ${CL_CYN}"\033[31m                        _/_/_/_/_/  _/    _/                      _/    _/  _/_/_/  \033[0m"${CL_RST}
	@echo -e ${CL_CYN}"\033[32m     _/_/    _/    _/      _/      _/    _/  _/_/_/  _/_/        _/    _/    _/     \033[0m"${CL_RST}
	@echo -e ${CL_CYN}"\033[33m  _/_/_/_/    _/_/        _/      _/_/_/_/  _/    _/    _/      _/    _/    _/      \033[0m"${CL_RST}
	@echo -e ${CL_CYN}"\033[34m _/        _/    _/      _/      _/    _/  _/    _/    _/      _/    _/    _/       \033[0m"${CL_RST}
	@echo -e ${CL_CYN}"\033[35m  _/_/_/  _/    _/      _/      _/    _/  _/    _/    _/        _/_/    _/_/_/      \033[0m"${CL_RST}
	@echo -e ${CL_CYN}""${CL_RST}
	@echo -e ${CL_CYN}"\033[31m=======================================================================================\033[0m "${CL_RST}
	@echo -e ${CL_CYN}"\033[36mexTHmUI -- Based on LineageOS\033[0m"${CL_RST}
	@echo -e ${CL_CYN}"\033[36mVisit our website https://exthmui.cn or our source repo https://github.com/exthmui\033[0m"${CL_RST}
	@echo -e ${CL_CYN}"\033[36mfor more information. \033[0m"${CL_RST}
	@echo -e ${CL_CYN}"\033[31m=======================================================================================\033[0m"${CL_RST}
	@echo -e ${CL_CYN}"\033[36mSpecial Thanks:cjybyjk, Col_or, KevinZonda, kmou424, GoogleChinaCEO, ISNing,\033[0m"${CL_RST}
	@echo -e ${CL_CYN}"\033[36mand all the other individuals and organizations that contribute!\033[0m"${CL_RST}
	@echo -e ${CL_CYN}"\033[31m==============================-Package Build Information-==============================\033[0m"${CL_RST}
	@echo -e ${CL_CYN}"Package File: $(EXTHM_TARGET_PACKAGE)" >&2 ${CL_RST}
	@echo -e ${CL_CYN}"MD5: "${CL_MAG}" `cat $(EXTHM_TARGET_PACKAGE).md5sum | cut -d ' ' -f 1`"${CL_RST}
	@echo -e ${CL_CYN}"Size:"${CL_MAG}" `ls -lah $(EXTHM_TARGET_PACKAGE) | cut -d ' ' -f 5`"${CL_RST}
	@echo -e ${CL_CYN}"\033[31m=======================================================================================\033[0m"${CL_RST}
	
