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
  - Infrastructure provisioning
  - Configuration and deployment

- **Monitoring**: Prometheus, Grafana, and Node Exporter
  - System metrics
  - Centralized dashboards

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
