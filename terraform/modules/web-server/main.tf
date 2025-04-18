variable "name" {
  description = "Name to be used for resources"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
  default     = {}
}

# Output variables will be defined in provider-specific implementations
