variable "ibm_region" {
  description = "IBM Cloud region to deploy resources"
  type        = string
  default     = "us-south"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "paper-social"
}

variable "instance_profile" {
  description = "IBM Cloud instance profile"
  type        = string
  default     = "cx2-2x4"
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
  type        = list(string)
  default     = ["paper-social", "terraform"]
}
