CONTAINER_NAME=jenkins201/jenkins201_jenkins
IMAGE_NAME=$(CONTAINER_NAME):latest
JENKINS_HOME_VOLUME=$(CONTAINER_NAME)_home

ifeq ($(shell uname -s),Darwin)
		TAG=$(shell date -u +"%Y-%m-%d")
    STAT_OPT = -f
else
		TAG=$(shell date -I -u)
    STAT_OPT = -c
endif

DOCKER_RUN=docker run --rm -p 127.0.0.1:8080:8080 -v /var/run/docker.sock:/var/run/docker.sock --group-add=$(shell stat $(STAT_OPT) %g /var/run/docker.sock)
DOCKER_RUN=docker run --rm -u root -p 8080:8080 -p 50000:50000 \
  -v $(JENKINS_HOME_VOLUME):/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --name $(CONTAINER_NAME) \
  $(IMAGE_NAME)

build:
	docker build -t $(IMAGE_NAME) .

run:	build
	$(DOCKER_RUN)

push:
	docker push $(IMAGE_NAME)

clean:
	-docker volume rm $(JENKINS_HOME_VOLUME)
	-docker rmi $(IMAGE_NAME)
