#!/bin/sh

TOP_DIR=$(pwd);

source ./settings.sh;

cd pcre-8.33;
export CC=$ACC
echo $CC;
# exit;
set -x
CC=$ACC LD=$ALD CCLD=$ALD AR=$AAR AS=$AAS CXX=$ACXX CFLAGS="-DANDROID -DNGX_SYS_NERR=1 -DIOV_MAX=16 -DNGX_HAVE_MAP_ANON=1 -I$TOP_DIR/compat -I$TOP_DIR/compat/libcrypt" ./configure --prefix=/sdcard/serv/stow/pcre-8.33   --target=arm-linux --host=x86_64;

cd -;

cd $TOP_DIR;

