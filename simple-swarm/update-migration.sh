#!/bin/bash


#CONTAINER_ID=`docker ps -f NAME=_simple -q`
#instalar tablas

for CONTAINER_ID in $(docker ps -f NAME=_simple -q) 
do
   echo "Actualizando base de datos para ${CONTAINER_ID}"
   docker exec -i ${CONTAINER_ID} php /var/www/html/index.php migration migrate

   docker exec -i ${CONTAINER_ID} /etc/init.d/php5-fpm restart

done
