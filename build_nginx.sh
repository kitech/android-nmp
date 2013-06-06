#!/bin/sh

TOP_DIR=$(pwd);

source ./settings.sh;

cd nginx-1.4.1;
export CC=$ACC
echo $CC;
# exit;
set -x
CC=$ACC LD=$ALD CCLD=$ALD CFLAGS="-DANDROID -DNGX_PCRE -DNGX_SYS_NERR=1 -DIOV_MAX=16 -DNGX_HAVE_MAP_ANON=1 -I$TOP_DIR/compat -I$TOP_DIR/compat/libcrypt -I/sdcard/serv/stow/pcre-8.33/include" ./configure --prefix=/sdcard/serv/stow/nginx-1.4.1 --without-poll_module --with-pcre --without-http_rewrite_module --http-client-body-temp-path=/data/local/tmp/client_body --http-proxy-temp-path=/data/local/tmp/proxy --http-fastcgi-temp-path=/data/local/tmp/fastcgi --http-uwsgi-temp-path=/data/local/tmp/uwsgi --http-scgi-temp-path=/data/local/tmp/scgi;

# add -L/sdcard/serv/stow/pcre-8.33/lib 到 objs/Makefile
# 删除 objs/Makefile 中的 -lmd 

# 为ngx_regex.c 添加两行include
# #include <pcre.h> 
# #include <ngx_regex.h>


cd -;

cd $TOP_DIR;

