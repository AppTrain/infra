module "qubole_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  # ##########################################################################
  # Base 

  name = "accuen-${var.env}-vpc"
  cidr = "10.43.0.0/16"
  azs  = "${var.vpc_azs}"

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

  private_subnets = ["10.43.1.0/24", "10.43.2.0/24"]

  private_subnet_tags = {
    isPublic = "false"
    PathName = "accuen-${var.env}-private-subnet"
  }

  private_route_table_tags = {
    isPublic = "false"
    PathName = "accuen-${var.env}-private-route-table"
  }

  # ##########################################################################
  # Database Subnets

  #   create_database_subnet_group = true
  #   database_subnets = ["10.43.3.0/24", "10.43.4.0/24"]

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

  public_subnets = ["10.43.5.0/24", "10.43.6.0/24"]

  public_subnet_tags = {
    isPublic = "true"
    PathName = "accuen-${var.env}-public-subnet"
  }

  public_route_table_tags = {
    isPublic = "true"
    PathName = "accuen-${var.env}-public-route-table"
  }

  # ##########################################################################
  # Tags

  tags = {
    Terraform   = "true"
    Project     = "accuen-${var.env}"
    Environment = "${var.env}"
  }
}

