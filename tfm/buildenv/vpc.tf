# data "aws_vpc" "default" {
#   default = true
# }

# data "aws_subnet_ids" "all" {
#   vpc_id = data.aws_vpc.default.id
# }

# data "aws_security_group" "default" {
#   vpc_id = data.aws_vpc.default.id
#   name   = "default"
# }

module "this_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  # ##########################################################################
  # Base

  name = "accuen-${var.env}-vpc"
  cidr = "10.42.0.0/16"
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

  private_subnets = ["10.42.1.0/24", "10.42.2.0/24"]

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
  #   database_subnets = ["10.42.3.0/24", "10.42.4.0/24"]

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

  public_subnets = ["10.42.5.0/24", "10.42.6.0/24"]

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
    Environment = var.env
  }
}

data "aws_vpc" "default" {
  id = "vpc-4a83e62f" # existing default vpc for accuen account
}

resource "aws_vpc_peering_connection" "connect_to_default" {
  peer_vpc_id = data.aws_vpc.default.id
  vpc_id      = module.this_vpc.vpc_id
  auto_accept = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  tags = {
    Name = "connect_build_to_default_vpc"
    env  = var.env
  }
}

locals {
  route_ids = distinct(concat(module.this_vpc.private_route_table_ids, [module.this_vpc.vpc_main_route_table_id], module.this_vpc.database_route_table_ids, module.this_vpc.elasticache_route_table_ids, module.this_vpc.public_route_table_ids, module.this_vpc.intra_route_table_ids, ))
}

resource "aws_route" "route_to_default" {
  count                     = length(local.route_ids)
  route_table_id            = local.route_ids[count.index]
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.connect_to_default.id
  #name = "connect_build_to_default_vpc_${count.index}"
}
