node {
  stage 'Prepare environment'
    checkout scm
    def environment  = docker.build 'jenkins-container'

    environment.inside {

      stage 'Test serverless install'
        sh 'serverless --help'
    }
  stage "Cleanup"
    deleteDir()
}