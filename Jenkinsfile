pipeline {

  environment {
    dockerimagename = "nikyta384/nginx-test"
    dockerImage = ""
  }

  agent {
    kubernetes {
      yaml '''
        apiVersion: v1
        kind: Pod
        metadata:
          labels:
            some-label: some-label-value
        spec:
          container:
          - name: maven
            image: maven:alpine

        '''
    }
  }

  stages {

    stage('image') {
      environment {
               registryCredential = 'dockerhublogin'
           }

      steps{
        container('maven'){
          script {
          dockerImage = docker.build dockerimagename

          docker.withRegistry( 'https://registry.hub.docker.com', registryCrede>
            dockerImage.push("latest")
          }

      }
    }
  }

    stage('Deploying App to Kubernetes') {
      steps {
        script {
          kubernetesDeploy(configs: "deploynginx.yaml", kubeconfigId: "my_kubernetes")
        }
      }
    }

  }

}
