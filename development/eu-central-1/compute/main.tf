# Fetch VPC by name
data "aws_vpc" "poc" {
  filter {
    name   = "tag:Name"
    values = ["poc-vpc"]
  }
}

# Fetch first public subnet in the VPC
data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.poc.id]
  }

  filter {
    name   = "tag:Name"
    values = ["poc-vpc-public-*"]
  }
}

# Amazon Linux 2023 latest AMI
data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

# Empty security group — add rules as needed
resource "aws_security_group" "ec2" {
  name        = "pasha-ec2-poc-sg"
  description = "Security group for pasha-ec2-poc EC2 instance"
  vpc_id      = data.aws_vpc.poc.id

  tags = var.tags
}

module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.0"
