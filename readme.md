**Comparus task**

***#1.1 Deploy kubernetes cluster***

1. Create VM Ubuntu.

![](https://github.com/nikyta384/picture/blob/main/1.png)

2. Install minikube and kubectl.

![](https://github.com/nikyta384/picture/blob/main/2.png)

Install was complete with these resources.

https://kubernetes.io/ru/docs/tasks/tools/install-minikube/

https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/

***#1.2 Deploy Jenkins service***

1. Build Docker image with Jenkins plugins.

![](https://github.com/nikyta384/picture/blob/main/5.png)

2. Write and apply Jenkins yaml files with persistent volume.

https://github.com/nikyta384/test-project-nginx/blob/main/deployJenkins/jenkins.yaml

https://github.com/nikyta384/test-project-nginx/blob/main/deployJenkins/j-slaves-service.yaml 

3. Install ingress for Jenkins service.

Enabling nginx-ingress controller with command 'minikube addons enable ingress'

Applying ingress controller from yaml file

https://github.com/nikyta384/test-project-nginx/blob/main/deployJenkins/j-ingress.yaml

![](https://github.com/nikyta384/picture/blob/main/7.png)

Completed deploy Jenkins

![](https://github.com/nikyta384/picture/blob/main/3.png)

***#1.3 Create Pipeline ***

Writing Docker file and yaml files for this task.

https://github.com/nikyta384/test-project-nginx/blob/main/Dockerfile

Configuring controlling assembly environments and Credentials in Jenkins for kubernetes.

Create secret from my Docker registry.

Create simple page index.html 

Write yaml file kaniko for build docker image.

https://github.com/nikyta384/test-project-nginx/blob/main/builderkaniko.yaml

Write Pipeline script Jenkinsfile.

https://github.com/nikyta384/test-project-nginx/blob/main/Jenkinsfile

Create Jenkins job for deployment docker image in kubernetes.

![](https://github.com/nikyta384/picture/blob/main/8.png)

Run Pipeline.

![](https://github.com/nikyta384/picture/blob/main/4.png)

And then deploy Nginx.

![](https://github.com/nikyta384/picture/blob/main/6.png)
