#!/bin/bash

CONTAINER_ID=`docker ps -f NAME=simple_simple -q`


for nodo in $(docker service ps --format "{{.Name}}" -f NAME=simple_simple -f desired-state=running simple) 
do
echo $nodo
docker exec -ti ${nodo} /etc/init.d/php5-fpm restart

done
