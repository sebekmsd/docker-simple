#!/bin/bash


URL="https://github.com/e-gob/SIMPLE.git"

PATH_SIMPLE=$HOME

while true; do
	echo "Indique la carpeta donde se instalará el código de SIMPLE"
	read -p "Por defecto será en ${HOME} : " input

	if [ -z $input ]; then
		echo "Instalación por defecto"

		if [ -d ${PATH_SIMPLE}/SIMPLE ]; then
			echo "Directorio ya existe"
			break
		fi

		git clone $URL ${PATH_SIMPLE}/SIMPLE
		break;
	fi

	if [ -d $input ]; then 
		echo "Existe"
		git clone $URL $input
		PATH_SIMPLE=$input
		break
	else
		echo "La Ruta especificada no existe ! $input"
		exit
	fi
done

echo "Instalación del código OK"

echo "Creando configuración de ambiente"

echo "WEBROOT=${PATH_SIMPLE}/SIMPLE" > .env
echo "MYSQL_ROOT=./data" >> .env

echo "Copiando configuración inicial por defecto"

cp assets/*.php ${PATH_SIMPLE}/SIMPLE/application/config

echo "Iniciando composer"

docker-compose up -d 

echo "Esperando que los servicios se encuentren operativos"

sleep 30s

MYSQL_CONTAINER=`docker ps -f NAME=simple_simple-db -q`

docker exec -ti ${MYSQL_CONTAINER} /init.sh

docker exec -ti ${MYSQL_CONTAINER} /installdb.sh

CONTAINER_ID=`docker ps -f NAME=simple_simple_ -q`
#instalar tablas

docker exec -ti ${CONTAINER_ID} php /var/www/html/index.php migration migrate

docker exec -ti ${CONTAINER_ID} /etc/init.d/php5-fpm restart

