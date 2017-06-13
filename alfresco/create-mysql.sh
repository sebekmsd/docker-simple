IMAGE=mysql:5.5

MYSQL_NAME


docker run -d --name $MYSQL_NAME --hostname=mysqlserver -e MYSQL_ROOT_PASSWORD=aloja123 -v $DBDIR:/var/lib/mysql -p 3306:3306 $MYSQL_IMAGE
