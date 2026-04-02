# Multi-Environment AWS Infrastructure with Terraform Modules

## 📌 Project Overview
This project automates the deployment of a scalable AWS infrastructure across three distinct environments: Development (Dev), Staging (Stg), and Production (Prd). By utilizing Terraform Modules, the setup ensures code reusability, consistency, and easy environment management.

## 🏗 Architecture Components
- Compute: EC2 Instances (t2 family) running Ubuntu 24.04 LTS.
- Storage: S3 Buckets for object storage.
- Database: DynamoDB tables for NoSQL data.
- Security: Dynamic Security Groups and SSH Key Pairs.
- Network: Deployment centered in the us-east-1 (N. Virginia) region.

## 📁 Directory Structure
├── main.tf  
├── provider.tf  
├── variables.tf  
├── infra-app/  
    ├── ec2.tf  
    ├── s3.tf  
    ├── dynamodb.tf  
    ├── variables.tf   
    └── terra-key-ec2.pub  

## 🚀 Getting Started

### Prerequisites
- Terraform
- AWS CLI configured

### Generate SSH Key
ssh-keygen -f terra-key-ec2

### Deployment
terraform init  
terraform plan  
terraform apply -auto-approve  

## 🛠 Challenges Solved
- Fixed ARM64 vs x86_64 mismatch  
- BIOS compatibility ensured  
- Modular env-based logic  

## 📋 Variables
| Name | Description | Default |
|------|------------|---------|
| region | AWS region | us-east-1 |
| instance_type | EC2 size | t2.micro |
| env | environment | dev/stg/prd |
| instance_count | instances | 1 |

## 🧹 Cleanup
terraform destroy -auto-approve  

---
Created by Ritesh Kumar Swain
