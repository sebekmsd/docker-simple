#!/bin/bash

CONTAINER_ID=`docker ps -f NAME=simple_simple -q`


for nodo in $(docker ps -f NAME=simple_simple -q) 
do
echo $nodo
docker exec -ti ${nodo} /etc/init.d/php5-fpm restart

done
