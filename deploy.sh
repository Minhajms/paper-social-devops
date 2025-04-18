#!/bin/bash

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}Paper.Social DevOps Deployment Script${NC}"
echo "=================================="

# Check if SSH key exists
if [ ! -f ~/.ssh/id_rsa.pub ]; then
    echo -e "${RED}SSH key not found. Generating one...${NC}"
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
    echo -e "${GREEN}SSH key generated.${NC}"
fi

# Initialize Terraform
echo -e "${BLUE}Initializing Terraform...${NC}"
cd terraform
terraform init

# Validate Terraform configuration
echo -e "${BLUE}Validating Terraform configuration...${NC}"
terraform validate

# Plan Terraform changes
echo -e "${BLUE}Planning Terraform changes...${NC}"
terraform plan -out=tfplan

# Apply Terraform changes
echo -e "${BLUE}Applying Terraform changes...${NC}"
terraform apply tfplan

# Generate Ansible inventory
echo -e "${BLUE}Generating Ansible inventory...${NC}"
AWS_PUBLIC_IP=$(terraform output -raw aws_public_ip)
IBM_FLOATING_IP=$(terraform output -raw ibm_floating_ip)

cat > ../ansible/inventory/hosts.yml << EOINV
---
all:
  children:
    aws:
      hosts:
        aws_instance:
          ansible_host: ${AWS_PUBLIC_IP}
    ibm:
      hosts:
        ibm_instance:
          ansible_host: ${IBM_FLOATING_IP}
  vars:
    ansible_user: ubuntu
    ansible_ssh_private_key_file: ~/.ssh/id_rsa
    ansible_python_interpreter: /usr/bin/python3
EOINV

# Wait for SSH to be available
echo -e "${BLUE}Waiting for SSH to be available...${NC}"
for host in $AWS_PUBLIC_IP $IBM_FLOATING_IP; do
    echo -n "Trying $host..."
    until ssh -o StrictHostKeyChecking=no -o ConnectTimeout=2 ubuntu@$host 'exit' 2>/dev/null; do
        echo -n "."
        sleep 5
    done
    echo -e " ${GREEN}connected!${NC}"
done

# Run Ansible playbook
echo -e "${BLUE}Running Ansible playbook...${NC}"
cd ../ansible
ansible-playbook -i inventory/hosts.yml site.yml

echo -e "${GREEN}Deployment completed successfully!${NC}"
echo -e "AWS app available at: http://${AWS_PUBLIC_IP}"
echo -e "IBM app available at: http://${IBM_FLOATING_IP}"
echo -e "AWS monitoring: http://${AWS_PUBLIC_IP}:3000 (admin/admin)"
echo -e "IBM monitoring: http://${IBM_FLOATING_IP}:3000 (admin/admin)"

cd ..
