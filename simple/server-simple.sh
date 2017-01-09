#!/bin/bash 

IMAGE=egob/simple:v1.6
#php:5.6-fpm
NAME=simple
DOCKERFILE=phpfpm.dockerfile
ROOT_DIR=$('pwd')

BASE_PATH="$(dirname "$ROOT_DIR")"

INTERNAL_PATH=/var/www/html

DBLINK=simple-db:mysqldb

#if [ $? -lt  1 ];
#then
#       echo "Parmetros aceptados:  comando [ create | remove | restart ]"
#       exit 1
#fi


if [ -z $WEBROOT ];
then
	WEBROOT=$HOME/workspace/SIMPLE
else
	echo "Estableciendo WEBROOT con: ${WEBROOT}"
fi


case $1 in
'build')
   #docker build -t $IMAGE -f $DOCKERFILE .
;;
'create-with-db')
	echo "Creando servidor con link a base de datos"
      docker run -i -d -t --name $NAME \
        --link $DBLINK \
        --hostname simple \
        -p 9000:9000 -v $WEBROOT:$INTERNAL_PATH  $IMAGE
;;
'create')
     echo "Creando un nuevo container"
     docker run -i -d -t --name $NAME \
        --hostname simple \
        -p 9000:9000 -v $WEBROOT:$INTERNAL_PATH  $IMAGE
;;
'remove')
        echo "Removiendo container"
        docker inspect $NAME
        if [ $? == 0 ];
        then
                docker stop $NAME
                docker rm $NAME
        else
                echo "No existe el contenedor"
        fi
;;
'restart')
        docker exec -i -t $NAME  /etc/init.d/php5-fpm restart
;;
'console')
 docker exec -i -t $NAME /bin/bash
;;

*)
    echo "No existe el comando"
    exit 1
esac

