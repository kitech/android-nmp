#!/bin/sh

TOP_DIR=$(pwd);

source ./settings.sh;

cd nginx-1.4.1;
export CC=$ACC
echo $CC;
# exit;
set -x
CC=$ACC LD=$ALD CCLD=$ALD CFLAGS="-DANDROID -DNGX_SYS_NERR=1 -DIOV_MAX=16 -DNGX_HAVE_MAP_ANON=1 -I$TOP_DIR/compat -I$TOP_DIR/compat/libcrypt -I$TOP_DIR/pcre-8.33/" ./configure --prefix=/sdcard/serv/stow/nginx-1.4.1 --without-poll_module --with-pcre --without-http_rewrite_module --http-client-body-temp-path=/data/local/tmp/client_body --http-proxy-temp-path=/data/local/tmp/proxy --http-fastcgi-temp-path=/data/local/tmp/fastcgi --http-uwsgi-temp-path=/data/local/tmp/uwsgi --http-scgi-temp-path=/data/local/tmp/scgi;

cd -;

cd $TOP_DIR;

