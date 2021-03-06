#! /bin/bash

echo "Stopping containers..."
docker stop $(docker ps -aq) > /dev/null 2>&1

echo "Cleaning up containers..."
docker rm $(docker ps -aq) > /dev/null 2>&1

echo "Cleaning up images..."
docker rmi $(docker images | grep ^sakai | awk '{print $1}') > /dev/null 2>&1
docker rmi $(docker images | grep '^<none>' | awk '{print $3}') > /dev/null 2>&1

echo "Building images..."
cd base
# docker build --progress=plain --tag sakai_base .
docker build --tag sakai_base .
cd ../mysql
docker build --tag sakai_mysql .
cd ../dev
docker build --tag sakai_dev .

