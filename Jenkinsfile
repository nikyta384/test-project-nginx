pipeline {

  agent {
    kubernetes {
      yamlFile 'builderkaniko.yaml'
    }
  }

  stages {

    stage('Kaniko Build & Push Image') {
      steps {
        container('kaniko') {
          script {
            sh '''
            /kaniko/executor --dockerfile `pwd`/Dockerfile \
                             --context `pwd` \
                             --destination=nikyta384/nginx-test:${BUILD_NUMBER}
            '''
          }
        }
      }
    }

    stage('Deploy App to Kubernetes') {     
      steps {
        container('kubectl') {
          withCredentials([file(credentialsId: 'my_kubernetes', variable: 'KUBECONFIG')]) {
            sh 'sed -i "s/<TAG>/${BUILD_NUMBER}/" deploynginx.yaml'
            sh 'kubectl apply -f deploynginx.yaml'
          }
        }
      }
    }
  
  }
}
