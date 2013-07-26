#!/bin/sh

# start|stop|restart

command=$1
PREFIX=/sdcard/serv/stow

case $command in
    start)
        $PREFIX/php-5.5.1/sbin/arm-linux-php-fpm -R -c $PREFIX/../etc/ -y $PREFIX/../etc/php-fpm.conf
        true;
        ;;
    stop)
        ps a|grep fpm|awk '{print $2}'|xargs kill
        true;
        ;;
    restart)
        ps a|grep fpm|awk '{print $2}'|xargs kill
        $PREFIX/php-5.5.1/sbin/arm-linux-php-fpm -R -c $PREFIX/../etc/ -y $PREFIX/../etc/php-fpm.conf
        true;
        ;;
    *)
        echo "Unknow command: start|stop|restart";
        true;
        ;;
esac


