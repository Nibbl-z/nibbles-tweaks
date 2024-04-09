TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = NibblesTweakPrefs

NibblesTweakPrefs_FILES = NBLRootListController.m
NibblesTweakPrefs_FRAMEWORKS = UIKit
NibblesTweakPrefs_PRIVATE_FRAMEWORKS = Preferences
NibblesTweakPrefs_INSTALL_PATH = /Library/PreferenceBundles
NibblesTweakPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
