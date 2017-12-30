#!/bin/bash -x
#

TARGET_CONTAINER="jenkins201/jenkins-container:latest"

docker build -t ${TARGET_CONTAINER} .

docker run \
  --rm \
  -u root \
  -p 8080:8080 \
  -p 50000:50000 \
  -v jenkins-data:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "$HOME":/home \
  --name jenkins201_jenkins \
  ${TARGET_CONTAINER}

docker rmi ${TARGET_CONTAINER}
docker volume rm jenkins-data
