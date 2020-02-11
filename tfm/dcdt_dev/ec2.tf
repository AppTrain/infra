locals {
  key_name = "dev_user_${var.user}"
}

data aws_iam_instance_profile "dev_machine" {
  name = "dev1_dev_machine"
}


data "template_cloudinit_config" "config" {
  gzip          = true
  base64_encode = true

  part {
    content = "#cloud-config\n---\nruncmd:\n - date"
  }

  # part {
  #   filename     = "init.cfg"
  #   content_type = "text/cloud-config"
  #   content      = "${data.template_file.script.rendered}"
  # }

  part {
    content_type = "text/x-shellscript"
    content      = templatefile("${path.module}/init.sh", { user = var.user, github_user = var.github_user, host_name = var.host_name, full_name = var.full_name, email = var.email, env = var.env })
    #templatefile("${path.module}/backends.tmpl", { port = 8080, ip_addrs = ["10.0.0.1", "10.0.0.2"] })
  }
}

resource "aws_instance" "this" {
  ami           = data.aws_ami.this.image_id
  instance_type = var.instance_type

  vpc_security_group_ids = [
    aws_security_group.this.id,
  ]

  key_name  = "annalect-dev1-bastion"
  subnet_id = var.subnet_id

  lifecycle {
    ignore_changes = [user_data_base64]
  }

  tags = {
    Name        = "dc_${var.env}_${var.user}"
    env         = var.env
    ansible     = var.env
    user        = var.user
    github_user = var.github_user
  }

  user_data_base64            = data.template_cloudinit_config.config.rendered
  iam_instance_profile        = data.aws_iam_instance_profile.dev_machine.name
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
