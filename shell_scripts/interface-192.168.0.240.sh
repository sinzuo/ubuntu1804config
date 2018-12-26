#!/bin/sh
ifconfig eno50332216 192.168.0.240
route delete default gw 192.168.2.1
route add default gw 192.168.0.1
echo "nameserver 192.168.0.1" > /etc/resolv.conf

