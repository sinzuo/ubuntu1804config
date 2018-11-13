方法一：

1、停止docker 服务

service docker stop
2、备份数据到新的存放路径

cp -r /var/lib/docker/* /mnt/docker
3、备份 /var/lib/docker 路径

mv /var/lib/docker  /var/lib/dockerbak}
4、创建软连接

ln -s /mnt/docker /var/lib/docker
5、启动docker

service docker start