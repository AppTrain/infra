
module "jason_dev_instance" {
  #source = "git@github.com:accuenmedia/infra.git//tfm/dcdt_dev"
  source        = "../../../tfm/dcdt_dev"
  env_version   = "annalect_dev_env_103"
  env           = "dev1"
  vpc_id        = data.aws_vpc.dev1.id
  subnet_id     = data.aws_subnet.dev1_public_2b.id
  full_name     = "Jason Miller"
  email         = "jason.miller@annalect.com"
  user          = "jason"
  github_user   = "jlmille4"
  zone_id       = data.aws_route53_zone.accuen.zone_id
  dns_name      = "jlm.accuenplatform.com"
  host_name     = "skippy"
  instance_type = "m5.xlarge"
  access_ssh = [
    local.ip.jeremiah_home,
    local.ip.jeremiah_office,
    local.ip.jason_home,
  ]
  access_web = [
    local.ip.jason_home,
  ]
}
