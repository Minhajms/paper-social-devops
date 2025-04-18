output "instance_id" {
  description = "ID of the created instance"
  value       = var.name
}

output "public_ip" {
  description = "Public IP address of the instance"
  value       = "To be defined by provider implementation"
}
