make clean
[清楚bin 目录]
make dirclean
[make clean]+[清除交叉编译工具及工具链目录]
make distclean
[清除所有相关的东西，包括下载的软件包，配置文件，feed内容等]

编译内核
make kernel_menuconfig

需要依赖的库
define Package/udpcwmp
  SECTION:=pifii
  CATEGORY:=PiFii
  TITLE:=udpcwmp for SZTozed's Router and AP
  DEPENDS:=+lua +luci-lib-json +libjson-c +libuci +libpthread
endef

不需要依赖的库
 DEPENDS:=@!TARGET_x86


 vim build/scripts/tozedap-p59/Makefile.tozedap-p59