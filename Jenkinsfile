pipeline {
  agent any
  environment {
    APP_NAME = 'demo-app'
  }
  stages {
    stage('Build') {
      steps {
        echo "Building ${APP_NAME}"
        bat 'echo build number is %BUILD_NUMBER%'
      }
    }
    stage('Test') {
      steps {
        echo 'Running tests'
      }
    }
    stage('List Files') {
      steps {
        bat 'dir'
      }
    }
    stage('Deploy') {
      steps {
        echo 'Deploying'
      }
    }
  }
  post {
    success { echo 'Pipeline passed' }
    failure { echo 'Pipeline failed' }
  }
}
