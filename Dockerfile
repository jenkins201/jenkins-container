FROM jenkins/jenkins:lts
# Add in the docker client so that we can talk to the host
# https://docs.docker.com/install/linux/docker-ce/debian/
USER root
RUN apt-get update
RUN apt-get install -y ca-certificates curl gnupg software-properties-common apt-transport-https
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get update && apt-get install -y docker-ce
# https://docs.docker.com/install/linux/linux-postinstall/#configure-docker-to-start-on-boot
RUN systemctl disable docker
USER jenkins
# Copy our seed job in to the container - this will then get persisted to
# the volume created on demand the first time we start the container with a
# volume mounted into /var/jenkins_home
# COPY jobs/jenkins-container-seed-job/config.xml /var/jenkins_home/jobs/jenkins-container-seed-job/config.xml
# Install the the plugins we need
ENV JENKINS_UC_DOWNLOAD https://updates.jenkins.io
RUN /usr/local/bin/install-plugins.sh job-dsl blueocean docker-workflow docker-slaves github-branch-source workflow-aggregator artifactory command-launcher credentials aws-java-sdk aws-credentials ansicolor role-strategy azure-credentials permissive-script-security configuration-as-code configuration-as-code-support test-results-analyzer
