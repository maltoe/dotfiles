#!/bin/sh

docker ps -a | grep 'Exited' | awk '{print $1}' | xargs docker rm
docker images | grep '^<none>' | awk '{print $3}' | xargs docker rmi
docker volume ls -qf dangling=true | xargs docker volume rm
