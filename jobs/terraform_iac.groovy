def project = 'jenkins201/terraform-iac'
def jobName = "${project}".replaceAll('/','-')

multibranchPipelineJob(jobName) {
    branchSources {
        git {
            remote {
              url("git://github.com/${project}.git")
            }
        }
    }
    orphanedItemStrategy {
        discardOldItems {
            numToKeep(20)
        }
    }
}
