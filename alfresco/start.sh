#!/bin/bash

NAME=alfresco

DATA=$('pwd')/alf_data

ID=$('docker ps -a --filter name=${NAME} -q')

echo $ID

#if [ ${ID} != '' ];
#then
#	echo "Eliminando conteiner actual: ${NAME} : ${ID}" 
#	docker rm $ID 
#fi

$DATA:/alfresco/alf_data


docker run --name $NAME -i -d -p 8080:8080 arkhotech/alfresco-5.1:1.0
