output "aws_instance_id" {
  description = "ID of the AWS EC2 instance"
  value       = aws_instance.web.id
}

output "aws_public_ip" {
  description = "Public IP address of the AWS EC2 instance"
  value       = aws_instance.web.public_ip
}

output "aws_public_dns" {
  description = "Public DNS of the AWS EC2 instance"
  value       = aws_instance.web.public_dns
}
