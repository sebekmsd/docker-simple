#!/bin/bash

BRANCH=$1

if [ -z ${BRANCH} ]; then
  BRANCH="develop"
fi

if [ -d "SIMPLE" ]; then
   echo "Actualizando codigo desde rama: ${BRANCH}"
   cd SIMPLE
   git pull origin ${BRANCH}
   if [ $? != 0 ]; then
      echo "Error al ejecutar comando"
   fi
fi

cd ..

VOLUME=$(docker volume inspect --format '{{ .Mountpoint }}' simple_codigo)

cp -r SIMPLE/* ${VOLUME}
