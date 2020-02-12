
module "mike_dev_instance" {
  #source = "git@github.com:accuenmedia/infra.git//tfm/dcdt_dev"
  source        = "../../../tfm/dcdt_dev"
  env_version   = "annalect_dev_env_102"
  env           = "dev1"
  vpc_id        = data.aws_vpc.dev1.id
  subnet_id     = data.aws_subnet.dev1_public_2b.id
  full_name     = "Mike Blake"
  email         = "xxxxxxxxx@annalect.com"
  user          = "mike"
  github_user   = "AppTrain"
  zone_id       = data.aws_route53_zone.accuen.zone_id
  dns_name      = "mb.accuenplatform.com"
  host_name     = "mb"
  instance_type = "m5.xlarge"
  access_ssh    = [local.jeremiah_office, local.jason_home]
  access_web    = [local.jeremiah_office, local.jason_home]
  #bastion_security_group_id = "${module.dev1bastion.security_group_id}"
}
