node {
  stage ('Prepare environment') {
    checkout scm
    def environment  = docker.build 'jenkins-container'

    environment.inside {
      stage ('Unit test') {
        sh 'serverless --help'
      }
        
      stage ('Integration test') {
        sh 'serverless deploy --stage dev'
        sh 'serverless invoke --stage dev --function hello'
      }
    }

  stage ("Cleanup") {
    deleteDir()
  }

  environment {
	 		AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
			AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
	 }
  }
}