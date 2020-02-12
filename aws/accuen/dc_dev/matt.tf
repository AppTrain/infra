
module "matt_dev_instance" {
  #source = "git@github.com:accuenmedia/infra.git//tfm/dcdt_dev"
  source        = "../../../tfm/dcdt_dev"
  env_version   = "annalect_dev_env_102"
  env           = "dev1"
  vpc_id        = data.aws_vpc.dev1.id
  subnet_id     = data.aws_subnet.dev1_public_2b.id
  full_name     = "Matt Artingstall"
  email         = "matt.artingstall@annalect.com"
  user          = "matt"
  github_user   = "martingstall"
  zone_id       = data.aws_route53_zone.accuen.zone_id
  dns_name      = "ma.accuenplatform.com"
  host_name     = "ma"
  instance_type = "m5.xlarge"
  access_ssh    = ["45.30.144.158/32"]
  access_web    = ["45.30.144.158/32"]
}
