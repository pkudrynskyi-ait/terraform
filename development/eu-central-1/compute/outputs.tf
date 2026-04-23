output "instance_id" {
  description = "EC2 instance ID"
  value       = module.ec2.id
}

output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.ec2.public_ip
}

output "security_group_id" {
  description = "ID of the EC2 security group"
  value       = aws_security_group.ec2.id
}

output "instance_name" {
  description = "Name tag of the EC2 instance"
  value       = module.ec2.tags["Name"]
}
