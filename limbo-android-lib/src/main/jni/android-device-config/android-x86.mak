#Generic defs first
include $(LIMBO_JNI_ROOT)/android-device-config/android-generic.mak

#Needs platform android-21

NDK_PLATFORM_API=21
APP_PLATFORM = android-$(NDK_PLATFORM_API)

# Set to true if you use platform-21 and above
USE_NDK_PLATFORM21 ?= true

ARCH_CFLAGS += -D__ANDROID_API__=$(NDK_PLATFORM_API)
ARCH_LD_FLAGS += -latomic

#CLANG ONLY
ifeq ($(NDK_TOOLCHAIN_VERSION),clang)
    ARCH_CLANG_FLAGS += -gcc-toolchain $(TOOLCHAIN_DIR)
    ARCH_CLANG_FLAGS += -target i686-none-linux-android
    ARCH_CFLAGS += $(ARCH_CLANG_FLAGS) -D__ANDROID_API__=$(NDK_PLATFORM_API)
    ARCH_CFLAGS += -fno-integrated-as
    ARCH_LD_FLAGS += -Wc,-target -Wc,i686-none-linux-android
    ARCH_LD_FLAGS += -Wc,-gcc-toolchain -Wc,$(TOOLCHAIN_DIR)
endif

#TARGET ARCH
APP_ABI := x86




