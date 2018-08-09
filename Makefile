PROJECT_NAME=jenkins201
CONTAINER_NAME=jenkins201/jenkins201_jenkins
IMAGE_NAME=$(CONTAINER_NAME):latest

all: 	build

build:
	docker build -t $(IMAGE_NAME) .

run:  build
	docker-compose --project-name $(PROJECT_NAME) up

push:
	docker push $(IMAGE_NAME)

clean:
	-docker kill jenkins201_artifactory
	-docker kill jenkins201_artifactory
	-docker rm jenkins201_jenkins
	-docker rm jenkins201_artifactory
	-docker volume rm $(PROJECT_NAME)_jenkins_data
	-docker volume rm $(PROJECT_NAME)_artifactory_data
	-docker rmi $(IMAGE_NAME)
