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
docker rmi res/apache_static
docker rmi res/express_students
docker rmi res/apache_reverse_proxy

#
# Build our docker images
#	
docker build --tag res/apache_static --file ./apache-php-image/Dockerfile ./apache-php-image/
docker build --tag res/express_students --file ./express-image/Dockerfile ./express-image/
docker build --tag res/apache-reverse-proxy --file ./apache-reverse-proxy/Dockerfile ./apache-reverse-proxy/

#
# Start containers
#
docker run -d --name apache_static res/apache_static
docker run -d --name express_students res/express_students
docker run -d --name apache-reverse-proxy -p 8080:80 res/apache-reverse-proxy
