# CI/CD Infrastructure on DigitalOcean with Terraform Cloud
#### Created by Dmitry Kozhel



## Scheme

This is a simple scheme of CD/CI infrasructure on DigitalOcean

![alt text](images/CI_CD_Infra.png "CI_CD_Infra")


For this CI/CD I use:

- Github repository: https://github.com/ferdinant122/projectTMS-infrastructure
- Terraform Cloud
- DigitalOcean
- Slack

## Steps:


### Push code on repo and create accounts

First developer need to push code on repository

I push to repo several tf files

| File | Value |
| ------ | ------ |
| cluster.tf | tf file with creating cluster info |
| main.tf | tf file with providers |
| variables.tf | tf file with variables |


Second need to create accounts on  Terraform Cloud https://app.terraform.io/  and  DigitalOcean https://cloud.digitalocean.com/

In DigitalOcean need to create a acess token it will be used to connect Terraform cloud to DigitalOcean Cloud

![alt text](images/DO_Token.png "DO_Token")


In Terraform Cloud  need create a Organization, my organization is ```dktmsproject```



### Create a workspaces in Terraform Cloud

After this need create a two workspace ``dev,prod``


Steps:

- In first step need to choise Type of workspace. I choise ```Version Control Workflow```

![alt text](images/TF_Cloud_CW.png "TF_Cloud_CW")


- Second step connect to github account and choise a repo, my repo is ``` https://github.com/ferdinant122/projectTMS-infrastructure ```


Connect Git
![alt text](images/TF_Cloud_connect.png "TF_Cloud_connect")


Choise Repo
![alt text](images/TF_Cloud_Choise_Repo.png "TF_Cloud_Choise_Repo")


Two created workspaces 

![alt text](images/TF_Cloud_workspaces.png "TF_Cloud_workspaces")

In this workspaces I need to add a variables (for each their own)


![alt text](images/TF_Cloud_variables.png "TF_Cloud_variables")


| Key | Value |
| ------ | ------ |
| do_token | Token for connect to DO |
| default_node_size | size of nodes (CPU&RAM) |
| max_nodes | max numbers of nodes |
| min_nodes | min numbers of nodes |
| region | region of cluster |
| cluster_version | version of cluster |
| cluster_name | name of cluster |

All of this variables  declared in ```variables.tf``` file

In general setting workspaces I choise  ```Manual Apply Method``` because I want to control my tf plan

![alt text](images/TF_Cloud_Manual.png "TF_Cloud_Manual")


### Connect to slack via webhook

Also I connect Terraform Cloud with my Slack channel via Webhook because I want to recive all notify and see when to make a plan


![alt text](images/TF_Cloud_Slack.png "TF_Cloud_Slack")


### Creating infrastructure

Terraform cloud scans github repo for the presence tf files and create a state (it stored on terraform cloud) 
If you change you tf files Terraform Cloud scan again repo and create new state and plan it.

![alt text](images/TF_cloud_states.png "TF_cloud_states")

After I apply plan 

![alt text](images/TF_Cloud_Plan_Apply.png "TF_Cloud_Plan_Apply")

I see a two new k8s cluster in digital ocean

![alt text](images/K8S_Clusters.png "K8S_Clusters")

and nodes

![alt text](images/Created_Nodes.png "Created_Nodes")

### Creating repo on DigitaOcean

Also need to create DigitalOcean repository and connet it to k8s clusters

![alt text](images/TF_cloud_repo.png "TF_cloud_repo")

Connect repo to clusters

![alt text](images/TF_Cloud_repo_connect.png "TF_Cloud_repo_connect")

### Finish
That's all! You great!

















