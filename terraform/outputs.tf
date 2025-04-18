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

output "ibm_instance_id" {
  description = "ID of the IBM Cloud instance"
  value       = module.ibm_infra.ibm_instance_id
}

output "ibm_floating_ip" {
  description = "Floating IP address of the IBM Cloud instance"
  value       = module.ibm_infra.ibm_floating_ip
}
