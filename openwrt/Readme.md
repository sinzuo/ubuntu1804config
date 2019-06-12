--------------------------------------------- 
作者：jiang_yi_bo
来源：广州芯卓信息科技有限公司
口号: all in onekey 【一切在一键】
网址：http://blog.sinzuo.com/article/
--------------------------------------------- 
版权声明：本文为博主原创文章，转载请附上博文链接！
openwrt 开源地址
https://github.com/openwrt/openwrt

1. Run "./scripts/feeds update -a" to obtain all the latest package definitions
defined in feeds.conf / feeds.conf.default

2. Run "./scripts/feeds install -a" to install symlinks for all obtained
packages into package/feeds/

3. Run "make menuconfig" to select your preferred configuration for the
toolchain, target system & firmware packages.

4. Run "make" to build your firmware. This will download all sources, build
the cross-compile toolchain and then cross-compile the Linux kernel & all
chosen applications for your target system.

./scripts/feeds update packages
./scripts/feeds install -a -p packages

编译 一个包
make ./package/feeds/management/freecwmp/clean

make ./package/feeds/management/freecwmp/compile V=99 

make package/feeds/packages/pptpd/clean

    10.保存patch文件到buildroot
        make package/feeds/packages/atftp/update V=s
    11.重新编译tftp-hpa包以测试修改
        make package/feeds/packages/atftp/{clean,compile} package/index V=s

最后生成root根目录
build_dir/target-x86_64_glibc/root-x86

staging_dir/target-mipsel_24kec+dsp_uClibc-0.9.33.2/root-ramips/etc/rc.d/

编译器目录
openwrtx86/staging_dir/toolchain-x86_64_gcc-7.3.0_glibc/bin
编译的工具所在目录
openwrtx86/staging_dir/host/bin

使用docker import导入镜像，导入后可以使用docker images查看看

docker import http://downloads.openwrt.org/releases/17.01.5/targets/x86/generic/lede-17.01.5-x86-generic-generic-rootfs.tar.gz lede-17.01.5 

docker import openwrt-snapshot-r8468-40cb63b-x86-64-generic-rootfs.tar.gz openwrtx86:1.0
docker run -i -t openwrtx86:1.0 /bin/ash
docker images

进入lede里的shell交互环境
docker run -i -t lede-17.01.5 /bin/ash

更新opkg 
opkg update 

尝试启动/usr/sbin/uhttpd，报错了，提示Error: No sockets bound, unable to continue 

/ # /usr/sbin/uhttpd
Error: No sockets bound, unable to continue

添加参数 
uhttpd -p 80 -h /www 

好了，可以启动了，现在用浏览器访问一下ip地址

 

先ifconfig列出lede的ip

/ # ifconfig eth0
eth0      Link encap:Ethernet  HWaddr 02:42:AC:11:00:02  
          inet addr:172.17.0.2  Bcast:0.0.0.0  Mask:255.255.0.0
          inet6 addr: fe80::42:acff:fe11:2/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:1159 errors:0 dropped:0 overruns:0 frame:0
          TX packets:1412 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:1603917 (1.5 MiB)  TX bytes:120743 (117.9 KiB)

package/base-files/files/bin/config_generate

<<<<<<< HEAD
CONFIG_TARGET_PROFILE=

./include/target.mk:PROFILE?=$(call qstrip,$(CONFIG_TARGET_PROFILE))

dts 目录
target/linux/ramips/dts
=======
hc5661a    适配 7628
whr-300hp2 适配 7620
newifi d1  适配 7621

>>>>>>> a5c2aeb031d17aa7cf54398d886322d2a2c06162

Proxifier  全局代理

polipo     全局代理

https://blog.csdn.net/u013286409/article/details/51481836



/sbin/wifi  reload_legacy


ubus list -v

ubus call network.interface.wan status
