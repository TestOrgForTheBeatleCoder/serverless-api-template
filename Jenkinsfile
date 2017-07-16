node {
  stage 'Prepare environment'
    checkout scm
    def environment  = docker.build 'jenkins-container'

    environment.inside {
      stage 'List directory'
        sh 'ls'

      stage 'Get directory path'
        sh 'echo $PWD'
      }

  stage "Cleanup"
    deleteDir()
}