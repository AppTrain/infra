
locals {
  jeremiah_office = "104.136.141.97/32"
  jeremiah_home   = "45.30.144.158/32"
}

module "jeremiah_dev_instance" {
  #source = "git@github.com:accuenmedia/infra.git//tfm/dcdt_dev"
  source        = "../../../tfm/dcdt_dev"
  env           = "dev1"
  vpc_id        = data.aws_vpc.dev1.id
  subnet_id     = data.aws_subnet.dev1_public_2b.id
  user          = "jeremiah"
  github_user   = "meantheory"
  zone_id       = data.aws_route53_zone.accuen.zone_id
  dns_name      = "dev63.accuenplatform.com"
  instance_type = "m5.xlarge"
  access_ssh    = [local.jeremiah_office, local.jeremiah_home]
  access_web    = [local.jeremiah_office, local.jeremiah_home]
  #bastion_security_group_id = "${module.dev1bastion.security_group_id}"
}
