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
CC="$ACC" LD=$ALD LDFLAGS="-lc" CFLAGS="-DANDROID -DNGX_SYS_NERR=1 -DIOV_MAX=16 $EDEFS_123 -I$TOP_DIR/compat -I$TOP_DIR/compat/libcrypt" ./configure --prefix=/sdcard/serv/stow/php-5.4.15 --disable-all --enable-fpm --enable-json --enable-zlib --enable-zip --enable-pdo  --with-pdo-sqlite3 --enable-sockets --enable-bcmath --enable-mbstring --enable-mbregex  --target=arm-linux --host=x86_64;

## #undef HAVE_LOCALE_H
## #undef HAVE_SETLOCALE

    # LC_CTYPE     = 0,
    # LC_NUMERIC   = 1,
    # LC_TIME      = 2,
    # LC_COLLATE   = 3,
    # LC_MONETARY  = 4,
    # LC_MESSAGES  = 5,
    # LC_ALL       = 6,
    # LC_PAPER     = 7,
    # LC_NAME      = 8,
    # LC_ADDRESS   = 9,

    # LC_TELEPHONE      = 10,
    # LC_MEASUREMENT    = 11,
    # LC_IDENTIFICATION = 12

if [ -f main/php_config.h ] ; then
    true;
    echo "#define LC_CTYPE 0"  >> main/php_config.h
    echo "#define LC_NUMERIC 1"  >> main/php_config.h
    echo "#define LC_TIME 2"  >> main/php_config.h
    echo "#define LC_COLLATE 3"  >> main/php_config.h
    echo "#define LC_MONETARY 4"  >> main/php_config.h
    echo "#define LC_ALL 6"  >> main/php_config.h
    echo "#undef HAVE_LOCALE_H" >> main/php_config.h
#    echo "#undef HAVE_SETLOCALE" >> main/php_config.h
fi


cd -;

cd $TOP_DIR;

