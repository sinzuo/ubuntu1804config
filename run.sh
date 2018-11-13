#!/bin/sh
proto=`pidof autossh |wc -l`
if [ "$proto" = "0" ]; then
	autossh -M 5403 -NR 5003:localhost:22 root@sintai.sinzuo.com -p22 &
fi

#/root/aliyun-ddns-client/ddns.py

huashengke=`pidof phddns |wc -l`
if [ "$proto" = "0" ]; then
#	/usr/bin/phddns -c /etc/phlinux.conf -d
fi
ddns=`tail -n 10 /var/log/phddns.log |grep "waiting for"|wc -l`
if [ "$ddns" = "0" ]; then
	echo 'jiangyibo'
else
#	killall phddns 2>&1 >/dev/null 


#	/usr/bin/phddns -c /etc/phlinux.conf -d
fi
