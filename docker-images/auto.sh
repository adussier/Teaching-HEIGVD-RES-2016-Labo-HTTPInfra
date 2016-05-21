#!/bin/bash

#
# This is a bit brutal (and will affect your system if you are running other
# containers than those of the lab)
#
docker kill $(docker ps -a -q)
docker rm $(docker ps -a -q)

#
# Remove the docker images
#
docker rmi res/apache

#
# Build our docker images
#	
docker build --tag res/apache --file ./apache-php-image/Dockerfile ./apache-php-image/

#
# Start containers
#
docker run -d --name res_apache1 -p 8081:80 res/apache
docker run -d --name res_apache2 -p 8082:80 res/apache
