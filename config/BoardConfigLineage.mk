include vendor/exthm/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/exthm/config/BoardConfigQcom.mk
endif

include vendor/exthm/config/BoardConfigSoong.mk
