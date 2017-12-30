def project = 'jenkins201/simple-java-maven-app'
def branchName = 'master'
def jobName = "${project}".replaceAll('/','-')

pipelineJob(jobName) {
    definition {
        cpsScm {
            scm {
								// Pass the parameters via a closure block to avoid the Job DSL default of creating a tag
								// https://stackoverflow.com/questions/36556572/jenkins-job-dsl-always-creates-a-git-tag-for-freestyle-jobs-using-the-git-plugin
								git {
									remote {
										url("git://github.com/${project}.git")
									}
									branch(branchName)
                  // Jenkinsfile or JenkinsFile?
                  scriptPath('Jenkinsfile')
								}
            }
        }
    }
}
