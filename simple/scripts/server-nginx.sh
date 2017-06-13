#!/bin/bash


NAME=nginx

IMAGE=nginx

ROOT_DIR=$('pwd')

INTERNAL_PATH=/var/www/html

BASE_PATH="$(dirname "$ROOT_DIR")"

if [ -z $WEBROOT ];
then
	echo "Estableciendo WEBROOT por defecto"
	WEBROOT=$HOME/workspace/SIMPLE
else 
	echo "Montando ruta: ${WEBROOT}"
fi



case $1 in

'remove')
        docker stop $NAME
        docker rm $NAME
;;

'create')
     docker run --name nginx --hostname nginx-server \
        -p 80:80 \
	--link simple:simple \
        -v $WEBROOT:$INTERNAL_PATH:ro \
        -v $ROOT_DIR/assets/nginx.conf:/etc/nginx/nginx.conf:ro \
        -d $IMAGE
;;
*)
esac
