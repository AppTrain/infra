
module "dean_dev_instance" {
  #source = "git@github.com:accuenmedia/infra.git//tfm/dcdt_dev"
  source        = "../../../tfm/dcdt_dev"
  env_version   = "annalect_dev_env_103"
  env           = "dev1"
  vpc_id        = data.aws_vpc.dev1.id
  subnet_id     = data.aws_subnet.dev1_public_2b.id
  full_name     = "Dean Kondo"
  email         = "dean.kondo@annalect.com"
  user          = "dean"
  github_user   = "dksf415"
  zone_id       = data.aws_route53_zone.accuen.zone_id
  dns_name      = "dk.accuenplatform.com"
  host_name     = "dk"
  instance_type = "m5.xlarge"
  access_ssh = [
    local.ip.jeremiah_home,
    local.ip.jeremiah_office,
    local.ip.jason_home,
  ]
  access_web = [
    local.ip.sf_office,
  ]
}
