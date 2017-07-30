node {
  stage ('Prepare environment') {
    checkout scm
    def environment  = docker.build 'jenkins-container'

    environment.inside('-u root') {
      stage ('Install dependencies') {
        //Error: EACCES: permission denied, mkdir '/.npm' when not running as root
        sh 'npm install'

        sh 'echo current directory is $PWD'
        sh 'echo current user is $USER'
        sh 'ls'
        sh 'serverless --help'
      }
        
      stage ('Unit test') {
        sh 'serverless --help'
      }
        
      stage ('Integration test') {
        withCredentials([string(credentialsId: 'AWS_ACCESS_KEY_ID', variable: 'AWS_ACCESS_KEY_ID'),string(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: 'AWS_SECRET_ACCESS_KEY')]) {
          // also fails on folder permissions but for '.aws' when not running as root
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