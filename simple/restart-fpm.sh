#!/bin/bash

CONTAINER_ID=`docker ps -f NAME=simple_simple_ -q`

docker exec -ti ${CONTAINER_ID} /etc/init.d/php5-fpm restart
