pipeline {
  agent any
  environment {
    IMAGE = 'sathw77/jenkins-demo'
  }
  stages {
    stage('Build Image') {
      steps {
        bat 'docker build -t %IMAGE%:%BUILD_NUMBER% .'
      }
    }
    stage('Scan Image') {
      steps {
        bat 'trivy image --severity HIGH,CRITICAL --exit-code 1 %IMAGE%:%BUILD_NUMBER%'
      }
    }
    stage('Push Image') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DH_USER', passwordVariable: 'DH_PASS')]) {
          bat 'echo %DH_PASS%| docker login -u %DH_USER% --password-stdin'
          bat 'docker push %IMAGE%:%BUILD_NUMBER%'
        }
      }
    }
  }
  post {
    always { bat 'docker logout' }
  }
}
