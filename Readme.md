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
