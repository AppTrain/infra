variable "github_token" {
  description = "github user token"
}


module "atlantis" {
  source  = "terraform-aws-modules/atlantis/aws"
  version = "~> 2.0"

  name = "atlantis"

  # VPC
  cidr            = "10.50.0.0/16"
  azs             = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnets = ["10.50.1.0/24", "10.50.2.0/24", "10.50.3.0/24"]
  public_subnets  = ["10.50.101.0/24", "10.50.102.0/24", "10.50.103.0/24"]

  # DNS (without trailing dot)
  route53_zone_name = "build-ops.out.accuenplatform.com"

  # ACM (SSL certificate) -
  # Specify ARN of an existing certificate or
  # new one will be created and validated using Route53 DNS
  # certificate_arn = "arn:aws:acm:eu-west-1:135367859851:certificate/70e008e1-c0e1-4c7e-9670-7bb5bd4f5a84"

  # Atlantis
  atlantis_github_user       = "accuenengineering"
  atlantis_github_user_token = "${var.github_token}"
  atlantis_repo_whitelist    = ["github.com/accuenmedia/*"]
}
