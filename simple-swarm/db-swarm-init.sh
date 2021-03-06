#!/bin/bash

MYSQL_CONTAINER=`docker ps -f NAME=_database -q`

docker exec -i ${MYSQL_CONTAINER} /init.sh

docker exec -i ${MYSQL_CONTAINER} /installdb.sh

CONTAINER_ID=`docker ps -f NAME=simple-qa_simple -q`
#instalar tablas
echo "Actualizando base de datos para ${CONTAINER_ID}"
docker exec -i ${CONTAINER_ID} php /var/www/html/index.php migration migrate

docker exec -i ${CONTAINER_ID} /etc/init.d/php5-fpm restart
