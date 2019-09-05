
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

  name = "${local.env}-vpc"
  cidr = "10.0.0.0/16"
  azs  = [
        "us-west-2a", 
        "us-west-2b",
        "us-west-2c",
        "us-west-2d",
    ]

  # ##########################################################################
  # --

  enable_dns_support = true
  enable_dns_hostnames = true
  enable_nat_gateway = true
  #dhcp_options

  nat_gateway_tags = {
    internet = "is_accessible"
  }

  # ##########################################################################
  # Private Subnets 

  private_subnets      = ["10.0.32.0/24", "10.0.33.0/24"]
  
  private_subnet_tags = {
    isPublic = "false"
    PathName = "annalect-${local.env}-private-subnet"
  }

  private_route_table_tags = {
    isPublic = "false"
    PathName = "annalect-${local.env}-private-route-table"
  }

  # ##########################################################################
  # Database Subnets

#   create_database_subnet_group = true
#   database_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

#   database_subnet_tags = {
#     Name        = "accuen-${local.env}-db-subnet"
#     Environment = "${local.env}"
#   }

#   database_subnet_group_tags = {
#     Name        = "accuen-${local.env}-db-subnet-group"
#     Environment = "${local.env}"
#   }

  # ##########################################################################
  # Public Subnets

  public_subnets = ["10.0.35.0/24", "10.0.36.0/24"]

  public_subnet_tags = {
    isPublic = "true"
    PathName = "annalect-${local.env}-public-subnet"
  }

  public_route_table_tags = {
    isPublic = "true"
    PathName = "annalect-${local.env}-public-route-table"
  }

  # ##########################################################################
  # Tags

  tags = {
    Terraform   = "true"
    Project     = "annalect-${local.env}"
    Environment = "${local.env}"
  }
}

