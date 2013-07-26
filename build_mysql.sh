#!/bin/sh

TOP_DIR=$(pwd);
INS_DIR=/sdcard/serv/stow

source ./settings.sh;

cd mysql-5.1.70;
export CC=$ACC
echo $CC;
# exit;
set -x
#CC="$ACC" LD=$ALD CFLAGS="-DANDROID -DNGX_SYS_NERR=1 -DIOV_MAX=16 -I$TOP_DIR/compat -I$TOP_DIR/compat/libcrypt" ./configure --prefix=/sdcard/serv/stow/php-5.4.15 --enable-fpm --without-pear --without-iconv --disable-libxml --disable-xml --disable-xmlreader --disable-xmlwriter --disable-simplexml --disable-dom          --disable-posix   --target=arm-linux --host=x86_64;
   
EDEFS="-DLC_CTYPE=0 -DLC_NUMERIC=1 -DLC_TIME=2 -DLC_COLLATE=3 -DLC_MONETARY=4 -DLC_MESSAGES=5 -DLC_ALL=6 -DLC_PAPER=7 -DLC_NAME=8 -DLC_ADDRESS=9 -DLC_TELEPHONE=10 -DLC_MEASUREMENT=11 -DLC_IDENTIFICATION=12";
CC="$ACC" LD=$ALD LDFLAGS="-lc -L$INS_DIR/ncurses-5.9/lib" CXXFLAGS="-DANDROID -DNGX_SYS_NERR=1 -DIOV_MAX=16 $EDEFS_123 -I$TOP_DIR/compat -I$TOP_DIR/compat/libcrypt -I$INS_DIR/ncurses-5.9/include/ncurses" ./configure --prefix=/sdcard/serv/stow/mysql-5.1.70 --with-pthread --target=arm-linux --host=x86_64;


cd -;

cd $TOP_DIR;

