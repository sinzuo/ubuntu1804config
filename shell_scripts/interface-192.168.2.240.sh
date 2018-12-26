#!/bin/sh
ifconfig eno50332216 192.168.2.240
route add default gw 192.168.2.1
echo "nameserver 192.168.2.1" > /etc/resolv.conf

