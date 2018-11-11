文件服务器  端口           9091
文件服务器2 管理   端口    9092

sudo vim /etc/systemd/resolved.conf 设置dns

设置 ddns 获取
cat /etc/crontab
*/1 *	* * *	root	/root/run_aliyun_ddns.sh

文件共享目录  shareDir
9095 owncloud  端口