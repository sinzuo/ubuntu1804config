#!/bin/sh

echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf 
#保存配置文件

sysctl -p
#输入以下命令以检查是否成功

sysctl net.ipv4.tcp_available_congestion_control