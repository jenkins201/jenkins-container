def project = 'jenkins201/packer-terraform-cicd-aws'
def jobName = "${project}".replaceAll('/','-')

multibranchPipelineJob(jobName) {
    branchSources {
        git {
            remote("git://github.com/${project}.git")
        }
    }
    orphanedItemStrategy {
        discardOldItems {
            numToKeep(20)
        }
    }
}
