#!/bin/bash
if [ $# -eq 1 ]; then
	echo "please input image name or id! exit"
    exit
fi
docker ps -a | grep $1 | awk '{print $1 }'|xargs docker stop
docker ps -a | grep $1 | awk '{print $1 }'|xargs docker rm
#docker images | grep none | grep -v REPOSITORY | awk '{print $3 }' | xargs docker rmi
