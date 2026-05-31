# Project Bedrock – Cloud-Native Retail Application

This project demonstrates deployment of a cloud-native application on AWS using Terraform and Kubernetes (EKS).

## Key Components:
- VPC with public/private subnets
- Amazon EKS cluster
- EC2 worker nodes
- Amazon RDS (MySQL & PostgreSQL)
- DynamoDB (product catalog)
- AWS Secrets Manager
- Application Load Balancer (ALB)
- Kubernetes Ingress

## Access:
The application is publicly accessible via AWS ALB.

## Architecture:
User → ALB → Kubernetes → Pods → Databases (RDS & DynamoDB)