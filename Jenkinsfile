pipeline {
  agent any	 

  stages {
    stage('Unit test') {
      steps {				
        sh 'serverless --help' // to ensure it is installed
      }
    }			

    stage('Integration test') {
      steps {
        sh 'serverless deploy --stage dev'
        sh 'serverless invoke --stage dev --function hello'					
      }
    }
  }

  environment {
    AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
    AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
  }
}