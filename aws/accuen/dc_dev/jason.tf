
locals {
  jason_home   = "45.30.144.158/32"
}

module "jason_dev_instance" {
  #source = "git@github.com:accuenmedia/infra.git//tfm/dcdt_dev"
  source        = "../../../tfm/dcdt_dev"
  env_version   = "annalect_dev_env_100"
  env           = "dev1"
  vpc_id        = data.aws_vpc.dev1.id
  subnet_id     = data.aws_subnet.dev1_public_2b.id
  full_name     = "Jason Miller"
  email         = "jason.miller@annalect.com"
  user          = "jason"
  github_user   = "jmille4"
  zone_id       = data.aws_route53_zone.accuen.zone_id
  dns_name      = "theboss.accuenplatform.com"
  host_name     = "theboss"
  instance_type = "m5.xlarge"
  access_ssh    = [local.jeremiah_office, local.jason_home]
  access_web    = [local.jeremiah_office, local.jason_home]
  #bastion_security_group_id = "${module.dev1bastion.security_group_id}"
}
