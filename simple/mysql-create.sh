#!/bin/bash

if [ -z "$MYSQL_DATADIR" ]; then
	echo "No se ha especificado la variable MYSQL_DATADIR, se usará por defecto el directorio actual"
	MYSQL_DATADIR=$('pwd')
fi

docker run --name simple-db --hostname=mysqlserver -v $MYSQL_DATADIR/datadir:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=simple123 -p 3306:3306  -d mysql:5.5
