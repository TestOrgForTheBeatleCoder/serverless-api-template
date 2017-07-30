node {
  stage ('Prepare environment') {
    withCredentials([usernamePassword(credentialsId: 'amazon', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
      sh 'echo $PASSWORD'
      echo "aws username: $USERNAME"
    }

    checkout scm
    def environment  = docker.build 'jenkins-container'

    environment.inside {
      stage ('Install dependencies') {
        sh 'npm install'
      }
        
      stage ('Unit test') {
        sh 'serverless --help'
      }
        
      stage ('Integration test') {
        sh 'serverless deploy --stage dev'
        sh 'serverless invoke --stage dev --function hello'
      }
    }
  }

  stage ('Cleanup') {
    deleteDir()
  }
}