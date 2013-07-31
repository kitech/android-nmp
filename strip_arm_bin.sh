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

function strip_mysql()
{
    PDIR=$INS_DIR/mysql-5.5.32
    set -x 
    for fn in `echo "COPYING docs include INSTALL-BINARY man mysql-test README sql-bench support-files"`
    do
        rm -rf $PDIR/$fn
    done
    
    $ASTRIP -g -S -d --strip-unneeded --verbose $PDIR/bin/*
    set +x
}


#strip_php;

strip_mysql;


