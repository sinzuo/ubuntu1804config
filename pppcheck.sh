#!/bin/sh
proto=`ifconfig |grep ppp |wc -l`
if [ "$proto" = "0" ]; then
	pppd call connect vpn &
fi

