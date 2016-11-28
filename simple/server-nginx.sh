#!/bin/bash


NAME=nginx

IMAGE=nginx

ROOT_DIR=$('pwd')

BASE_PATH="$(dirname "$ROOT_DIR")"

WEBROOT=$HOME/workspace/SIMPLE

INTERNAL_PATH=/var/www/html


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
