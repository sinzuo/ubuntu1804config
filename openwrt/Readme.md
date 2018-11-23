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
