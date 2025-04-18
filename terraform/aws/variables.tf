variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "paper-social"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"  # Updated to Free Tier–eligible instance type
}

variable "ssh_public_key" {
  description = "Public SSH key content for instance access"
  type        = string
}

variable "ssh_public_key_path" {
  description = "Path to the public SSH key for instance access (deprecated)"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default = {
    Project     = "Paper.Social"
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}
