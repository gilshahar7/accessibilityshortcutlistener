ARCHS = arm64e arm64
export TARGET = iphone:clang:11.2:7.0

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AccessibilityShortcutListener

AccessibilityShortcutListener_FILES = Tweak.x
AccessibilityShortcutListener_LIBRARIES = activator
AccessibilityShortcutListener_CFLAGS = -fobjc-arc


include $(THEOS_MAKE_PATH)/tweak.mk
