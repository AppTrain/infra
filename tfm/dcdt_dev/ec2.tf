locals {
  key_name = "dev_user_${var.user}"
}

resource "aws_instance" "this" {
  ami           = data.aws_ami.this.image_id
  instance_type = var.instance_type

  vpc_security_group_ids = [
    aws_security_group.smp_dev.id,
  ]

  key_name  = local.key_name
  subnet_id = var.subnet_id

  # lifecycle {
  #   ignore_changes = ["subnet_id"]
  # }

  tags = {
    Name    = "annalect_smp_dev_${var.env}_${var.user}"
    env     = var.env
    ansible = var.env
    user    = var.user
  }

  #user_data = "${data.template_file.user_data.rendered}"
  #iam_instance_profile = "${aws_iam_instance_profile.ec2_instance.name}"
  associate_public_ip_address = true

  root_block_device {
    volume_type = "io1"
    volume_size = 3000
    iops        = 3000
  }
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
