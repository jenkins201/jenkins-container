FROM jenkinsci/blueocean
# Copy our seed job in to the container - this will then get persisted to
# the volume created on demand the first time we start the container with a
# volume mounted into /var/jenkins_home
COPY jobs/jenkins-container-seed-job/config.xml /var/jenkins_home/jobs/jenkins-container-seed-job/config.xml
RUN /usr/local/bin/install-plugins.sh job-dsl docker-slaves github-branch-source
