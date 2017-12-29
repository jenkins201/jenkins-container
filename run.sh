#!/bin/bash -x
docker pull jenkins/jenkins:lts
docker build -t jenkins201/jenkins-container:latest .
docker run -p 8080:8080 -p 50000:50000 -v ${PWD}:/var/jenkins_home jenkins201/jenkins-container:latest

# open the UI
# open http://127.0.0.1:8080
