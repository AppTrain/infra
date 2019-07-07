data "aws_caller_identity" "this" {}

data "aws_ami" "smp_db" {
  most_recent = true

  filter {
    name   = "name"
    values = ["annalect_smp_db*"]
  }

  owners = ["${data.aws_caller_identity.this.account_id}"]
}

resource "aws_instance" "smp_db" {
  ami           = "${data.aws_ami.smp_db.image_id}"
  instance_type = "m5.xlarge"

  vpc_security_group_ids = [
    "${data.aws_security_group.bastion.id}",
  ]
  
  key_name  = "annalect-buildenv-build-ops-ansible"
  subnet_id = "${data.aws_subnet.west_2b_public.id}"
  associate_public_ip_address = true

  tags = {
    Name        = "annalect-smp-db-${var.env}"
    env         = "${var.env}"
    ansible     = "${var.env}_smp_db"
  }

  #user_data = "${data.template_file.user_data.rendered}"
  #iam_instance_profile = "${aws_iam_instance_profile.ec2_instance.name}"
  #associate_public_ip_address = false

#   root_block_device = {
#     volume_type = "gp2"
#     volume_size = 32
#   }
}

# data "template_file" "user_data" {
#   # system_info:
#   # default_user:
#   #   name: annalectau
#   template = <<-EOF
#               #!/bin/bash
#               apt-get update -y
#               apt-get install ntp -y
#               apt-get install ntpstat -y
#               ntpq -pcrv
#               EOF
# }