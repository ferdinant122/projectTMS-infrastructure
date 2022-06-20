# ECS-deployment-using-terraform
This document will provide you all the details how to configure the github actions to deploy the ECS Service using terraform


## Create AWS resources using Terraform

In this workflow, we will deploy an ECS service using following AWS resources 
 1. VPC
 2. Security Groups
 3. ECS Cluster
 4. ECS Service
 5. Application Load Balancer
 6. IAM Role
 7. Task Definition for ECS Service
 8. Target Groups for ALB

 ## How to test

 1. Get the loadbalancer DNS name
 2. Open it in the browser `http://DNSName/LoginWebApp-1

## Github Actions Workflow 

To have basic understanding of Github actions, please follow [Github Action Basic Video](https://www.youtube.com/watch?v=0VELgZOJs78)

To have basic understanding of terraform Deployment using Github actions, please follow [Terraform Deployment using Github Actions](https://youtu.be/sNQNdBqSz3A)

## Basics of Github actions in the workflow

  1. Use a build matrix if you want your workflow to run tests across multiple combinations of operating systems, platforms, and languages. 
  3. Use of matrix to run the workflow for different environments or even you can set different variables as per the environment if needed
  4. Connect to AWS account using Github secrets
  6. Use of `workflow-dispatch` to trigger the workflow manually
  7. Use of `max-parallel` to run the job for both the environments in parallel
  8. Set working directory to any of your subfolder
  9. Use of Environments in the workflow to approve the changes for higher environments if needed.



## Deploy only when push to main branch (deploy.yaml)

We will be applying the changes only when there is a push in the main branch.


## References
1. https://docs.github.com/en/actions/learn-github-actions/managing-complex-workflows
2. https://docs.github.com/en/actions/learn-github-actions/understanding-github-actions
