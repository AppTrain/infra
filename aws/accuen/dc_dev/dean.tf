
module "dean_dev_instance" {
  #source = "git@github.com:accuenmedia/infra.git//tfm/dcdt_dev"
  source        = "../../../tfm/dcdt_dev"
  env_version   = "annalect_dev_env_102"
  env           = "dev1"
  vpc_id        = data.aws_vpc.dev1.id
  subnet_id     = data.aws_subnet.dev1_public_2b.id
  full_name     = "Dean Kondo"
  email         = "dean.kondo@annalect.com"
  user          = "awesome"
  github_user   = "xxxxxxxxxxxx"
  zone_id       = data.aws_route53_zone.accuen.zone_id
  dns_name      = "dk.accuenplatform.com"
  host_name     = "dk"
  instance_type = "m5.xlarge"
  access_ssh    = ["45.30.144.158/32"]
  access_web    = ["45.30.144.158/32"]
}
