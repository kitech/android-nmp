pwd=android-nmp(anmp)

android-nginx: 
*) 需要手机已经root
*) nginx.conf配置，需要user root;
*) 编译时需要修改几个文件，
*) 启动时需要把nginx放到/data/local/tmp/nginx目录
*) 或者把/sdcard/重新挂载，支持rw挂载参数，mount -o remount,rw /storage/sdcard0
*) ifconfig wlan0 当前IP。
*) adb shell后执行bash能得到一个更好用些的shell
*) adb forward tcp:8080 tcp:80  可把本地端口转到手机端口，不过本地端口开在localhost上
*) sdcard的文件系统格式需要修改成ext4的了。



