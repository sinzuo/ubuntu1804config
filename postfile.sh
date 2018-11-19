#!/bin/sh
curl  -F "file=@./$1" http://qq.sinzuo.com:9091/image
echo "send command"