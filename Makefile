CONTAINER_NAME=jenkins201/jenkins-container
IMAGE_NAME=$(CONTAINER_NAME):latest
JENKINS_HOME_VOLUME=$(CONTAINER_NAME)_home

all: 	build

build:
	docker build -t $(IMAGE_NAME) .

run:  build push
	docker-compose up

push:
	docker push $(IMAGE_NAME)

clean:
	-docker volume rm $(JENKINS_HOME_VOLUME)
	-docker rmi $(IMAGE_NAME)
