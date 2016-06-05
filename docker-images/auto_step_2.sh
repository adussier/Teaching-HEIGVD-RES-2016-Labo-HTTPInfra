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
docker rmi res/express_students

#
# Build our docker images
#	
docker build --tag res/express_students --file ./express-image/Dockerfile ./express-image/

#
# Start containers
#
docker run -d --name express_students -p 8081:3000 res/express_students
