LOCAL_PATH := $(my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := TabletSettingsApk
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := TabletSettings.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_CERTIFICATE := platform

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := TabletSystemUIApk
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := TabletSystemUI.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_CERTIFICATE := platform

include $(BUILD_PREBUILT)