resource "aws_key_pair" "smp" {
  key_name   = "annalect_${var.env}_smp"
  public_key = file(pathexpand("~/.annalect/ssh/builder.pub"))
}

resource "aws_instance" "smp_db" {
  ami           = data.aws_ami.smp_db.image_id
  instance_type = var.instance_type
  count         = length(var.instances)

  vpc_security_group_ids = [
    aws_security_group.smp_db.id,
  ]

  key_name  = aws_key_pair.smp.key_name
  subnet_id = var.subnet_id

  # lifecycle {
  #   ignore_changes = ["subnet_id"]
  # }

  tags = {
    Name    = "annalect_smp_${var.env}_${count.index}"
    env     = var.env
    ansible = var.env
  }

  #user_data = "${data.template_file.user_data.rendered}"
  #iam_instance_profile = "${aws_iam_instance_profile.ec2_instance.name}"
  associate_public_ip_address = false

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
