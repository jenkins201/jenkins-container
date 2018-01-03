#!/bin/bash -x
#

./build_container_and_volume.sh

docker rmi ${TARGET_CONTAINER}
docker volume rm jenkins-data
