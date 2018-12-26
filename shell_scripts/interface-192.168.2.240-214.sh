#!/bin/sh
ifconfig eno50332216 192.168.2.240
route add default gw 192.168.2.214
echo "nameserver 202.96.128.166" > /etc/resolv.conf

