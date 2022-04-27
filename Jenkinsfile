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
                             --destination=nikyta384/nginx-test:latest
            '''
          }
        }
      }
    }

    stage('Deploy App to Kubernetes') {     
      steps {
        sshagent (credentials: ['ssh-login']) {
            sh 'ssh -o StrictHostKeyChecking=no -l pavlovskyi 192.168.1.101 uname -a'
            sh 'sed -i "s/<TAG>/${BUILD_NUMBER}/" deploynginx.yaml'
            sh 'kubectl apply -f deploynginx.yaml'
          }
        }
      }

  }
}
