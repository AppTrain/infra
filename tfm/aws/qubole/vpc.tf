module "qubole_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  # ##########################################################################
  # Base

  name = "qubole-${var.env}"
  cidr = var.vpc_cidr
  azs  = var.vpc_azs

  # ##########################################################################
  # --

  enable_dns_support   = true
  enable_dns_hostnames = true
  enable_nat_gateway   = true

  #dhcp_options

  nat_gateway_tags = {
    internet = "is_accessible"
  }

  # ##########################################################################
  # Private Subnets

  private_subnets = ["10.0.2.0/24", "10.0.3.0/24"] # TODO: make vars

  private_subnet_tags = {
    isPublic = "false"
    PathName = "qubole-${var.env}"
  }

  private_route_table_tags = {
    isPublic = "false"
    PathName = "qubole-${var.env}"
  }

  # ##########################################################################
  # Database Subnets

  #   create_database_subnet_group = true
  #   database_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

  #   database_subnet_tags = {
  #     Name        = "accuen-${var.env}-db-subnet"
  #     Environment = "${var.env}"
  #   }

  #   database_subnet_group_tags = {
  #     Name        = "accuen-${var.env}-db-subnet-group"
  #     Environment = "${var.env}"
  #   }

  # ##########################################################################
  # Public Subnets

  public_subnets = ["10.0.5.0/24"] # TODO: make vars

  public_subnet_tags = {
    isPublic = "true"
    PathName = "qubole-${var.env}"
  }

  public_route_table_tags = {
    isPublic = "true"
    PathName = "qubole-${var.env}"
  }

  # ##########################################################################
  # Tags

  tags = {
    Terraform   = "true"
    Project     = "qubole-${var.env}"
    Environment = var.env
  }
}
