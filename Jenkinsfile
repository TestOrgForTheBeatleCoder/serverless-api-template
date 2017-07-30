node {
  stage ('Prepare environment') {
    withCredentials([string(credentialsId: 'AWS_ACCESS_KEY_ID', variable: 'AWS_ACCESS_KEY_ID'),string(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: 'AWS_SECRET_ACCESS_KEY')]) {
      sh 'echo aws key $AWS_SECRET_ACCESS_KEY'
      echo "aws id: $AWS_ACCESS_KEY_ID"
    }

    //withCredentials([usernamePassword(credentialsId: 'amazon', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
    //  sh 'echo $PASSWORD'
    //  echo "aws username: $USERNAME"
    //}

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