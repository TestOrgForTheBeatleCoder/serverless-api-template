node {
  stage ('Prepare environment') {
    checkout scm
    def environment  = docker.build 'jenkins-container'

    environment.inside('-u root') {
      stage ('Install dependencies') {
        //Error: EACCES: permission denied, mkdir '/.npm' when not running as root
        sh 'npm install'
      }
        
      stage ('Unit test') {
        sh 'serverless --help'
      }
        
      stage ('Integration test') {
        withCredentials([string(credentialsId: 'AWS_ACCESS_KEY_ID', variable: 'AWS_ACCESS_KEY_ID'),string(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: 'AWS_SECRET_ACCESS_KEY')]) {
          // also fails on '.aws' folder permissions when not running as root
          sh 'serverless deploy --stage dev'

          // this hangs
          //sh 'serverless invoke --stage dev --function hello'
        }
      }
    }
  }

  // fails with AccessDeniedException
  //stage ('Cleanup') {
  //  deleteDir()
 // }
}