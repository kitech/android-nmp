#!/bin/sh

TOP_DIR=$(pwd);
INS_DIR=/sdcard/serv/stow

source ./settings.sh;

PKGVER=5.5.32
mkdir -pv mysql-5.5.32_build/;
cd mysql-5.5.32_build;
export CC=$ACC
echo $CC;
# exit;
set -x
#CC="$ACC" LD=$ALD CFLAGS="-DANDROID -DNGX_SYS_NERR=1 -DIOV_MAX=16 -I$TOP_DIR/compat -I$TOP_DIR/compat/libcrypt" ./configure --prefix=/sdcard/serv/stow/php-5.4.15 --enable-fpm --without-pear --without-iconv --disable-libxml --disable-xml --disable-xmlreader --disable-xmlwriter --disable-simplexml --disable-dom          --disable-posix   --target=arm-linux --host=x86_64;
   
EDEFS="-DLC_CTYPE=0 -DLC_NUMERIC=1 -DLC_TIME=2 -DLC_COLLATE=3 -DLC_MONETARY=4 -DLC_MESSAGES=5 -DLC_ALL=6 -DLC_PAPER=7 -DLC_NAME=8 -DLC_ADDRESS=9 -DLC_TELEPHONE=10 -DLC_MEASUREMENT=11 -DLC_IDENTIFICATION=12";
# CC="$ACC" LD=$ALD LDFLAGS="-lc -L$INS_DIR/ncurses-5.9/lib" CXXFLAGS="-DANDROID -DNGX_SYS_NERR=1 -DIOV_MAX=16 $EDEFS_123 -I$TOP_DIR/compat -I$TOP_DIR/compat/libcrypt -I$INS_DIR/ncurses-5.9/include/ncurses" ./configure --prefix=/sdcard/serv/stow/mysql-5.1.70 --with-pthread --with-atomic-ops=rwlocks --target=arm-linux --host=x86_64;

CXX_DEFS="-DHAVE_CXX_NEW=1 -DHAVE_CXXABI_H=1 -Dpthread_cancel=void"

#rm -vf CMakeCache.txt
CC="$ACC" CXX="$ACXX" LD=$ALD LDFLAGS="-lc -L$INS_DIR/ncurses-5.9/lib -lncurses $INS_DIR/ncurses-5.9/lib/libncurses.a -L$INS_DIR/readline-6.2/lib -lreadline $INS_DIR/readline-6.2/lib/libreadline.a" CXXFLAGS="-DANDROID -DNGX_SYS_NERR=1 -DIOV_MAX=16 $EDEFS_123 $CXX_DEFS -I/opt/android-ndk/sources/cxx-stl/gabi++/include/ -I$TOP_DIR/compat -I$TOP_DIR/compat/libcrypt -I$INS_DIR/ncurses-5.9/include/ncurses -I$INS_DIR/ncurses-5.9/include/ -I$INS_DIR/readline-6.2/include " cmake ../mysql-5.5.32/ -DCMAKE_INSTALL_PREFIX=$INS_DIR/mysql-$PKGVER -DCMAKE_VERBOSE_MAKEFILE=on -DWITH_FEDERATED_STORAGE_ENGINE=off -DWITH_UNIT_TESTS=off -DWITH_LIBEDIT=off -DHAVE_CURSES_H=1


####
sed -i 's/MY_S_IREAD/MY_S_IREAD S_IRUSR \/\//g' $TOP_DIR/mysql-${PKGVER}/include/my_dir.h
sed -i 's/MY_S_IWRITE/MY_S_IWRITE S_IWUSR \/\//g' $TOP_DIR/mysql-${PKGVER}/include/my_dir.h 

####
ESC_INS_DIR=$(echo $INS_DIR | sed 's/\//\\\//g')
sed -i "s/o mysql/o mysql $ESC_INS_DIR\/readline-6.2\/lib\/libreadline.a $ESC_INS_DIR\/ncurses-5.9\/lib\/libncurses.a/g"   client/CMakeFiles/mysql.dir/link.txt
sed -i "s/o mysql/o mysql $ESC_INS_DIR\/readline-6.2\/lib\/libreadline.a $ESC_INS_DIR\/ncurses-5.9\/lib\/libncurses.a/g"   client/CMakeFiles/mysql.dir/relink.txt
sed -i 's/\.\/comp_err/qemu-arm \.\/comp_err/g' extra/CMakeFiles/GenError.dir/build.make
# comp_sql
sed -i 's/\.\/gen_lex_hash/qemu-arm \.\/gen_lex_hash/g' sql/CMakeFiles/sql.dir/build.make
sed -i 's/\.\/gen_lex_hash/qemu-arm \.\/gen_lex_hash/g' sql/CMakeFiles/GenServerSource.dir/build.make

SED_SRC=`pwd`/scripts/comp_sql
ESC_SED_SRC=$(echo $SED_SRC | sed 's/\//\\\//g')
sed -i "s/$ESC_SED_SRC/qemu-arm $ESC_SED_SRC/g" scripts/CMakeFiles/GenFixPrivs.dir/build.make


# ushort的问题出现的比较多。
# error: no matching function for call to 'operator new(sizetype, st_order**&)'


cd -;

cd $TOP_DIR;

