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
               sh '''
                 whoami
		 sleep 99
		 git clone https://github.com/nikyta384/test-project-nginx.git &&  cd test-project-nginx && kubectl apply -f deploynginx.yaml
		
                  '''
          }
        }
      }
    }
  }

