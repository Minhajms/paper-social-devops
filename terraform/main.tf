terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "~> 1.45.0"
    }
  }
}

module "aws_infra" {
  source = "./aws"

  project_name        = var.project_name
  aws_region          = var.aws_region
  instance_type       = var.aws_instance_type
  ssh_public_key_path = var.ssh_public_key_path
  tags                = var.tags_as_map
}

module "ibm_infra" {
  source = "./ibm"

  project_name        = var.project_name
  ibm_region          = var.ibm_region
  instance_profile    = var.ibm_instance_profile
  ssh_public_key_path = var.ssh_public_key_path
  tags                = var.tags_as_list
}
