output "aws_instance_id" {
  description = "ID of the AWS EC2 instance"
  value       = module.aws_infra.aws_instance_id
}

output "aws_public_ip" {
  description = "Public IP address of the AWS EC2 instance"
  value       = module.aws_infra.aws_public_ip
}

output "aws_public_dns" {
  description = "Public DNS of the AWS EC2 instance"
  value       = module.aws_infra.aws_public_dns
}

# Mock IBM outputs for demonstration
output "ibm_instance_id" {
  description = "Mocked ID of the IBM Cloud instance"
  value       = "ibm-mock-instance"
}

output "ibm_floating_ip" {
  description = "Mocked Floating IP address of the IBM Cloud instance"
  value       = "192.168.2.20"  # Mocked IP for demo
}
