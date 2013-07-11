pwd=android-nmp(anmp)

android-nginx: 
*) 需要手机已经root
*) nginx.conf配置，需要user root;
*) 编译时需要修改几个文件，
*) 启动时需要把nginx放到/data/local/tmp/nginx目录
*) 或者把/sdcard/重新挂载，支持rw挂载参数，mount -o remount,rw /mnt/sdcard
*) ifconfig wlan0 当前IP。



