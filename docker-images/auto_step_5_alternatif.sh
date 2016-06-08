#!/bin/bash

#
# This is a bit brutal (and will affect your system if you are running other
# containers than those of the lab)
#
docker kill $(docker ps -a -q)
docker rm $(docker ps -a -q)

#
# Start containers
#
docker run -d --name dummy res/apache_static
docker run -d --name apache_static res/apache_static
docker run -d --name express_students res/express_students
docker run -d --name apache_reverse_proxy -e STATIC_APP=172.17.0.3:80 -e DYNAMIC_APP=172.17.0.4:3000 -p 8080:80 res/apache_reverse_proxy
