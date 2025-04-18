variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "paper-social"
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "aws_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ibm_region" {
  description = "IBM Cloud region to deploy resources"
  type        = string
  default     = "us-south"
}

variable "ibm_instance_profile" {
  description = "IBM Cloud instance profile"
  type        = string
  default     = "cx2-2x4"
}

variable "ssh_public_key_path" {
  description = "Path to the public SSH key for instance access"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "tags_as_map" {
  description = "Tags to apply to AWS resources"
  type        = map(string)
  default = {
    Project     = "Paper.Social"
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}

variable "tags_as_list" {
  description = "Tags to apply to IBM resources"
  type        = list(string)
  default     = ["paper-social", "dev", "terraform"]
}
