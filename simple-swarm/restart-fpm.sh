#!/bin/bash

for nodo in $(docker ps -f NAME=$1 -q) 
do
echo $nodo
docker exec -ti ${nodo} /etc/init.d/php5-fpm restart

done
