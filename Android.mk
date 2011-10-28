# Copyright (C) 2011 The Android Open Source Project
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

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := calendar-common
LOCAL_SDK_VERSION := current

# We want to use libphonenumber in the app.  It's a private API, which means
# we can't use it directly from an unundled app, so we build a static copy
# here.  Because it's also part of ext.jar, we need to rename its package,
# or the class loaders will favor the (possibly incompatible) framework copy.
LOCAL_SRC_FILES := \
    $(call all-java-files-under, src) \
    $(call all-java-files-under, ../../../external/libphonenumber/java/src)
LOCAL_JARJAR_RULES := $(LOCAL_PATH)/jarjar-rules.txt

include $(BUILD_STATIC_JAVA_LIBRARY)

# Build the test package
include $(call all-makefiles-under, $(LOCAL_PATH))
