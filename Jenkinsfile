pipeline {
  agent any
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')  
  }
  stages {
    stage('checkout git') {
      steps {
        git 'https://github.com/cubensquare/myproject1.git'
      }
    }

    stage('Build image') {
      steps{
        sh 'docker build -t "cubensquare/python"  "$WORKSPACE"/'
        }
      }
  
    stage('Login to dockerhub and quay.io') {

      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }

    stage('Push Image') {
      steps{
         sh 'docker push cubensquare/python'
      }
    }

    stage('Deploy App') {
      steps {
        script {
          kubernetesDeploy(configs: "frontend.yaml", kubeconfigId: "kube")
        }
      }
    }
 }
 }
