module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.18"

  name = "poc-vpc"
  cidr = var.vpc_cidr

  azs             = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  intra_subnets   = var.intra_subnets

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }

  tags = var.tags
}
