node {
  stage 'Prepare environment'
    checkout scm
    def environment  = docker.build 'jenkins-container'

    environment.inside {
      stage ('Unit test') {
        sh 'serverless --help'
      }
        
      stage 'Integration test' {
        sh 'serverless deploy --stage dev'
        sh 'serverless invoke --stage dev --function hello'
      }
    }

  stage "Cleanup"
    deleteDir()
}