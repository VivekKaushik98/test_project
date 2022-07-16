# test_project


## Problem Statement:
To deploy Mediawiki website to Azure Kubernetes Cluster via various tools.

To begin with I would like to update the approach which I have thought. I had to setup the local environment from scratch as I did not have any tools or Azure Account already.

### Application deployment to Kubernetes via helm charts:

### Approach 1:
To deploy the Mediawiki with required pkgs and tools on Kubernetes cluster using custom docker image and deploying the manifest via helm. 

### Approach 2:
Or we can create a Azure Linux os VM and use Ansible as VM config tool to config the required setting and pkgs.

## Infrastructure as Code via Terraform:

To deploy the required infra for kubernetes terraform IaC tool is used. The directory structure is as follows

.
├── README.md
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf 
├── modules/....

To login to Azure we will need a credential configured with Contributer Access and Owner permission to add in Access IAM
Created and assigned one spn to run the terraform plan

![image](https://user-images.githubusercontent.com/30085103/179346814-a4421c25-bca0-4be7-8ecc-48238c966964.png)


To create Azure Kubernetes Cluster AKS I have run terraform plan with default config 
The output for terraform plan is as below.
![image](https://user-images.githubusercontent.com/30085103/179347729-502d8f9c-da55-4ca1-ac60-f01d63ec4283.png)

terraform plan
![image](https://user-images.githubusercontent.com/30085103/179347786-6e795027-7458-49b7-be7d-a124e4782e1c.png)


### To avoid storing credential, spn, in text we can use data block to fetch it from the keyvaults directly.

## Configuration Management via Ansible: 
To modify the configuration of the VM or container I have made some the changes by deploying the two docker containers on default network The requirements include openssh-server,client, python3 ansible and root login enabled

I created two pods
one on which our application was running and other on which Ansible was installed and via ssh run one Ansible playbook to modify the existing application on the other pod.

The output after applying config via ansible  :
![image](https://user-images.githubusercontent.com/30085103/179346980-93042a4f-0149-4074-bb02-589d31a7e29b.png)

The application pod output 
Before applying the playbook mariadb was not installed and once the playbook is completed it was up and running
![image](https://user-images.githubusercontent.com/30085103/179347074-6ec33c32-2f66-4566-b071-a8ba736dedb1.png)


#The Application Deployment consists of below parts:
Steps:
### DockerImage:
The idea here is to install or pull the required os and some pkgs at the build stage itself and exposing the ports.

1.	pull centos image from dockerhub.
2.	Add packages like apache, php, etc to the image
3.	configure properties
4.	we can push image to ghcr or acr

Adding multiple image layers helped incase error is there so isolating the error at that image layer.

Image build:
![image](https://user-images.githubusercontent.com/30085103/179347579-9c46b593-e203-4827-bff4-a4838b388f80.png)


Image after build:
![image](https://user-images.githubusercontent.com/30085103/179347375-70f4c641-4f28-4f5e-b961-b41371f02891.png)



### Helm:
To deploy the application to aks via Docker image I prepared the helm manifests and updated the details for the service and deployment in values.yaml file it will become easy to maintain the manifests for environment specfic configs in case of multi environment setup.

1.	Install helm
2.	Config helm at a dir
3.	Create helm templates for aks manifest files
4.	build helm chart
5.	deploy helm chart config to aks

The helm chart output is as below.
![image](https://user-images.githubusercontent.com/30085103/179347242-d7526f11-1757-453b-8679-2252e0e96544.png)

The new k8s pod created via helm
![image](https://user-images.githubusercontent.com/30085103/179347286-3936fb05-c2d4-48df-889a-c058a1e0b66e.png)



For CI/CD I have structured the github actions under directory .github/workflows/


The final application is as below:


## The final application is as below:
![image](https://user-images.githubusercontent.com/30085103/179346248-b774cec0-dbef-4818-99e0-13105890a0c0.png)


