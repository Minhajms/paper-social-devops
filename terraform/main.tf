terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

# Create an SSH key for use in both AWS and IBM Cloud
resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

module "aws_infra" {
  source = "./aws"

  project_name   = var.project_name
  aws_region     = var.aws_region
  instance_type  = var.aws_instance_type
  ssh_public_key = tls_private_key.ssh.public_key_openssh
  tags           = var.tags_as_map
}

# Output the private key for Ansible to use
resource "local_file" "private_key" {
  content         = tls_private_key.ssh.private_key_pem
  filename        = "${path.module}/id_rsa"
  file_permission = "0600"
}
