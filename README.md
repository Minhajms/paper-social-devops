# Paper.Social Multi-Cloud Deployment

This project implements a multi-cloud deployment pipeline for Paper.Social using AWS and IBM Cloud.

## Architecture Overview

This infrastructure deploys a simple web application across both AWS and IBM Cloud environments with the following components:

- **Infrastructure**: Provisioned using Terraform
  - Virtual machines on AWS (EC2) and IBM Cloud
  - Security groups/firewalls
  - Networking components

- **Configuration**: Managed with Ansible
  - Docker installation
  - Application deployment
  - Monitoring setup

- **CI/CD Pipeline**: Implemented with GitHub Actions
  - Automated testing
  - Infrastructure validation
  - Configuration management

- **Monitoring**: Prometheus, Grafana, and Node Exporter
  - System metrics
  - Centralized dashboards

## Important Note for Assessment

This project demonstrates a multi-cloud deployment pipeline between AWS and IBM Cloud. 

For assessment purposes, the GitHub Actions workflow runs in a "mock deployment" mode:
- All Terraform code is validated for proper structure and syntax
- The Ansible playbooks are executed in check mode to demonstrate configuration management
- This approach avoids hitting cloud provider limits while still demonstrating DevOps skills

In a production environment with appropriate cloud permissions and quotas, the deployment would:
1. Create actual cloud resources with Terraform
2. Configure the instances with Ansible
3. Deploy the application and monitoring stack

## Technical Challenges Addressed

During development, the following challenges were identified and solutions implemented:

1. **AWS Resource Limits**: 
   - New AWS accounts have limits on resources like VPCs (5 per region) and vCPUs
   - Used t2.nano for instance type to stay within vCPU limits
   - Created a robust workflow that can handle resource limitations

2. **IBM Cloud Trial Limitations**:
   - Trial accounts cannot create VPC resources
   - Implemented a hybrid approach to demonstrate multi-cloud architecture

3. **SSH Key Management**:
   - Implemented dynamic SSH key generation to avoid key conflicts
   - Ensured secure key handling in the CI/CD pipeline

## Prerequisites

- AWS account with access credentials
- IBM Cloud account with API key
- GitHub account (if using GitHub Actions)
- Terraform >= 1.0.0
- Ansible >= 2.9
- Docker and Docker Compose

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/paper-social-devops.git
cd paper-social-devops
