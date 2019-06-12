--------------------------------------------- 
作者：jiang_yi_bo 
来源：广州芯卓信息科技有限公司 
口号: all in onekey 【一切在一键】
网址：http://blog.sinzuo.com/article/ 
--------------------------------------------- 

用户名  sinzuo  密码 sinzuo@abc

文件服务器  端口           9091 
文件服务器2 管理   端口     9092 
文件服务器5 管理   端口     9095   owncloud 

sudo vim /etc/resolvconf/resolv.conf.d/head 设置dns
添加
nameserver 192.168.3.1

设置 ddns 获取
cat /etc/crontab
*/1 *	* * *	root	/root/run_aliyun_ddns.sh

文件共享目录  shareDir
9095 owncloud  端口

192.168.3.214  操作 功能验证 使用   ubuntu 18.04 的虚拟机

192.168.3.242  主要是作为服务器 文件服务器 使用，虚拟机服务器使用
               主要要用docker 来实现服务器功能


mount -o nolock  -t nfs 192.168.3.242:/nfs /mnt
mount -o nolock  -t nfs 192.168.100.1:/nfs /mnt/eShare

docker 运行可以指定目录 直接运行
make -f myDocker/jybdockerfiles/TServ/Makefile run

建立两个 软链接
lrwxrwxrwx   1 root root    25 11月 13 16:39 /gitServer -> /mnt/dShare/gitserverDir/
lrwxrwxrwx   1 root root    24 11月 15 11:11 /shareDir9091 -> /mnt/dShare/shareDir9091

上传文件工具
curlpost.sh testServer

scp -P 12345 qemu-guest-agent-2.3.0-4.el7.x86_64.rpm root@10.10.10.11:/shareDir9091

http://github.com/sinzuo/7628rombuild
http://github.com/sinzuo/pifiirom
http://github.com/sinzuo/mipshttppost
http://github.com/sinzuo/myDocker
http://github.com/sinzuo/golangTest
http://github.com/sinzuo/TServ

同步
rsync -avz -e ssh      dl/   root@192.168.3.242:/mnt/dShare/openwrtDir/dl/
查看日志
pon myvpn debug dump logfd 2 nodetach

x86 固件 多功能
https://github.com/coolsnowwolf/lede.git