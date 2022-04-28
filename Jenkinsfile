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
   }
 }
