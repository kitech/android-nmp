#!/bin/bash

# set the base path to your Android NDK (or export NDK to environment)
NDK_BASE=/opt/android-ndk

if [[ "x$NDK_BASE" == "x" ]]; then
    NDK_BASE=/usr/local/android-ndk
    echo "No NDK_BASE set, using $NDK_BASE"
fi

NDK_PLATFORM_VERSION=8
NDK_SYSROOT=$NDK_BASE/platforms/android-$NDK_PLATFORM_VERSION/arch-arm
NDK_UNAME=`uname -s | tr '[A-Z]' '[a-z]'`
# NDK_TOOLCHAIN_BASE=$NDK_BASE/toolchains/arm-linux-androideabi-4.4.3/prebuilt/$NDK_UNAME-x86
NDK_TOOLCHAIN_BASE=$NDK_BASE/toolchains/arm-linux-androideabi-4.7/prebuilt/$NDK_UNAME-x86_64
ACC="$NDK_TOOLCHAIN_BASE/bin/arm-linux-androideabi-gcc --sysroot=$NDK_SYSROOT"
# ACC="$NDK_TOOLCHAIN_BASE/bin/arm-linux-androideabi-gcc"
ACXX="$NDK_TOOLCHAIN_BASE/bin/arm-linux-androideabi-g++ --sysroot=$NDK_SYSROOT"
ALD=$NDK_TOOLCHAIN_BASE/bin/arm-linux-androideabi-ld
AELF=$NDK_TOOLCHAIN_BASE/bin/arm-linux-androideabi-readelf
AAR=$NDK_TOOLCHAIN_BASE/bin/arm-linux-androideabi-ar
AAS=$NDK_TOOLCHAIN_BASE/bin/arm-linux-androideabi-as

NDK_LDPATH="-L${NDK_SYSROOT}/usr/lib"


ARM7_CFLAGS="-mcpu=cortex-a8"

# i use only a small number of formats - set this to 0 if you want everything.
# changed 0 to the default, so it'll compile shitloads of codecs normally
if [[ "x$minimal_featureset" == "x" ]]; then
    minimal_featureset=1
fi

function current_dir {
    echo "$(cd "$(dirname $0)"; pwd)"
}

