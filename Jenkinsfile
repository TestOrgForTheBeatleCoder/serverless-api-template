node {
  stage ('Prepare environment') {
    

    checkout scm
    def environment  = docker.build 'jenkins-container'

    environment.inside {
      //stage ('Install dependencies') {
      //  sh 'npm install'
      //}
        
      stage ('Unit test') {
        sh 'the current user is $UID'
        sh 'serverless --help'
      }
        
      stage ('Integration test') {
        withCredentials([string(credentialsId: 'AWS_ACCESS_KEY_ID', variable: 'AWS_ACCESS_KEY_ID'),string(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: 'AWS_SECRET_ACCESS_KEY')]) {
          sh 'serverless config credentials --provider aws --key $AWS_ACCESS_KEY_ID --secret $AWS_SECRET_ACCESS_KEY'
          sh 'serverless deploy --stage dev'
          sh 'serverless invoke --stage dev --function hello'
        }
      }
    }
  }

  stage ('Cleanup') {
    deleteDir()
  }
}