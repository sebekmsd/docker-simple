#!/bin/bash

MYSQL_CONTAINER=`docker ps -f NAME=simple_database -q`

docker exec -i ${MYSQL_CONTAINER} /init.sh

docker exec -i ${MYSQL_CONTAINER} /installdb.sh

CONTAINER_ID=`docker ps -f NAME=simple_simple -q`
#instalar tablas

docker exec -i ${CONTAINER_ID} php /var/www/html/index.php migration migrate

docker exec -i ${CONTAINER_ID} /etc/init.d/php5-fpm restart
