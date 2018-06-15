FROM jenkinsci/blueocean
# Copy our seed job in to the container - this will then get persisted to
# the volume created on demand the first time we start the container with a
# volume mounted into /var/jenkins_home
COPY jobs/jenkins-container-seed-job/config.xml /var/jenkins_home/jobs/jenkins-container-seed-job/config.xml
# Install the the plugins we need
# docker-workflow:1.15 has the fix for container detection on Docker for Mac
RUN /usr/local/bin/install-plugins.sh job-dsl docker-workflow:1.15 docker-slaves github-branch-source workflow-aggregator artifactory command-launcher aws-credentials ansicolor
