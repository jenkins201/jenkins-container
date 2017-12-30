def project = 'jenkins201/simple-java-maven-app'

def branchName = 'master'
def jobName = "${project}-${branchName}".replaceAll('/','-')

job(jobName) {
    scm {
        git("git://github.com/${project}.git", branchName)
    }
    steps {
        maven("test -Dproject.name=${project}/${branchName}")
    }
}
