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

# Security group for pasha-ec2-development instance
resource "aws_security_group" "ec2" {
  name        = "pasha-ec2-development-sg"
  description = "Security group for pasha-ec2-development EC2 instance"
  vpc_id      = data.aws_vpc.poc.id

  tags = var.tags
}

module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.0"

  name                   = "pasha-ec2-development"
  ami                    = data.aws_ami.al2023.id
  instance_type          = var.instance_type
  subnet_id              = data.aws_subnets.public.ids[0]
  vpc_security_group_ids = [aws_security_group.ec2.id]
  associate_public_ip_address = true

  tags = var.tags
}
