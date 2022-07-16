# test_project


## Problem Statement: To deploy Mediawiki website to Azure Kubernetes Cluster via various tools.
To begin with I would like to update the approach which I have thought.
Application deployment to Kubernetes via helm charts:
Approach 1:
1.	To deploy the Mediawiki with required pkgs and tools on Kubernetes cluster using custom docker image and deploying the manifest via helm. Approach 2:
2.	Or we can create a Azure Linux os VM and use Ansible as VM config tool to config the required setting and pkgs.
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

## Configuration Management via Ansible: 
To modify the configuration of the VM or container I have made some the changes by deploying the two docker containers on default network The requirements include openssh-server,client, python3 ansible and root login enabled
Below is the output screenshots:
#The Application Deployment consists of below parts:
Steps:
### Docker:
1.	pull centos image from dockerhub.
2.	Add packages like apache, php, etc to the image
3.	configure properties
4.	we can push image to ghcr or acr
### Helm:
1.	Install helm
2.	Config helm at a dir
3.	Create helm templates for aks manifest files
4.	build helm chart
5.	deploy helm chart config to aks
For CI/CD I have structured the github actions under directory .github/workflows/
The final application is as below:


## The final application is as below:
![image](https://user-images.githubusercontent.com/30085103/179346248-b774cec0-dbef-4818-99e0-13105890a0c0.png)


