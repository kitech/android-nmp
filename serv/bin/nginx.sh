#!/bin/sh

# start|stop|restart

command=$1
PREFIX=/sdcard/serv/stow

case $command in
    start)
        $PREFIX/nginx-1.4.1/sbin/nginx -c $PREFIX/nginx-1.4.1/conf/nginx.conf
        true;
        ;;
    stop)
        $PREFIX/nginx-1.4.1/sbin/nginx -s stop
        true;
        ;;
    restart)
        $PREFIX/nginx-1.4.1/sbin/nginx -s stop
        $PREFIX/nginx-1.4.1/sbin/nginx -c $PREFIX/nginx-1.4.1/conf/nginx.conf
        true;
        ;;
    reload)
        $PREFIX/nginx-1.4.1/sbin/nginx -c $PREFIX/nginx-1.4.1/conf/nginx.conf -s reload
        true;
        ;;
    *)
        echo "Unknow command: start|stop|restart";
        true;
        ;;
esac



