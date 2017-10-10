#|/bin/bash

URL_GIT="https://github.com/arkhotech/SIMPLE.git"


if [ -z ${BRANCH} ]; then
   echo "Estableciendo branch por defecto 'feature/catalogo'"
   BRANCH="feature/catalogo"
fi

if [ ! -d SIMPLE ]; then
   echo "Recuperando código desde Git"
    git clone ${URL_GIT} SIMPLE
fi

cd SIMPLE

git checkout ${BRANCH}

echo "Copiando configuración"
cp ../assets/*.php  ./application/config

cd ..

docker-compose build simple

docker-compose build nginx 

docker-compose push


docker stack deploy --compose-file docker-compose.yml simple

#actualizar el código

VOLUME=$(docker volume inspect --format '{{ .Mountpoint }}' simple_codigo)

cp -r SIMPLE/* ${VOLUME}
