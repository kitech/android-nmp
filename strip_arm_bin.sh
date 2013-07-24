#!/bin/sh

INS_DIR=/sdcard/serv/stow

source ./settings.sh


function strip_php()
{
    PDIR=$INS_DIR/php-5.5.1
    set -x
    rm -rf $PDIR/etc $PDIR/php $PDIR/lib $PDIR/include $PDIR/var
    $ASTRIP -g -S -d --strip-unneeded --verbose $PDIR/bin/* $PDIR/sbin/*
    set +x
}


strip_php;

