#!/bin/sh

TOP_DIR=$(pwd);

source ./settings.sh;

cd php-5.4.15;
export CC=$ACC
echo $CC;
# exit;
set -x
#CC="$ACC" LD=$ALD CFLAGS="-DANDROID -DNGX_SYS_NERR=1 -DIOV_MAX=16 -I$TOP_DIR/compat -I$TOP_DIR/compat/libcrypt" ./configure --prefix=/sdcard/serv/stow/php-5.4.15 --enable-fpm --without-pear --without-iconv --disable-libxml --disable-xml --disable-xmlreader --disable-xmlwriter --disable-simplexml --disable-dom          --disable-posix   --target=arm-linux --host=x86_64;
   
EDEFS="-DLC_CTYPE=0 -DLC_NUMERIC=1 -DLC_TIME=2 -DLC_COLLATE=3 -DLC_MONETARY=4 -DLC_MESSAGES=5 -DLC_ALL=6 -DLC_PAPER=7 -DLC_NAME=8 -DLC_ADDRESS=9 -DLC_TELEPHONE=10 -DLC_MEASUREMENT=11 -DLC_IDENTIFICATION=12";
CC="$ACC" LD=$ALD LDFLAGS="-lc" CFLAGS="-DANDROID -DNGX_SYS_NERR=1 -DIOV_MAX=16 $EDEFS -I$TOP_DIR/compat -I$TOP_DIR/compat/libcrypt" ./configure --prefix=/sdcard/serv/stow/php-5.4.15 --disable-all   --target=arm-linux --host=x86_64;


cd -;

cd $TOP_DIR;

