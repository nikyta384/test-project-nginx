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
           sshagent(credentials: ['ssh-login']) {
               sh returnStatus: true, script: 'git clone https://github.com/nikyta384/test-project-nginx.git'
               sh returnStatus: true, script: 'cd test-project-nginx'
               sh returnStatus: true, script: 'kubectl apply -f deploynginx.yaml'
          }
        }
      }
    }
  }

