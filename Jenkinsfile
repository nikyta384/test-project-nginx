pipeline {

  environment {
    registry = "nikyta384/nginx-test"
    dockerImage = ""
  }

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git branch: 'test-branch', url: 'https://github.com/nikyta384/test-project-nginx.git'
      }
    }
 
    stage('Build image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }

    stage('Push Image') {
      steps{
        script {
          docker.withRegistry( "" ) {
            dockerImage.push()
        }
      }
    }
  }

    stage('Deploying App to Kubernetes') {
      steps {
        script {
          kubernetesDeploy(configs: "deploynginx.yml", kubeconfigId: "my_kubernetes")
        }
      }
    }

  }

}
