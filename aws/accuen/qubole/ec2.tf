resource "aws_key_pair" "ssh" {
  key_name   = "annalect-dig-${var.env}-jeremiah"
  public_key = "${var.env_ssh_key}"
}

resource "aws_instance" "qubole_bastion" {
  ami           = "${data.aws_ami.qubole_bastion.image_id}"
  instance_type = "m5.xlarge"
  count         = 1

  vpc_security_group_ids = [
    "${aws_security_group.qubole_bastion.id}",
  ]
  key_name  = "${aws_key_pair.ssh.key_name}"
  subnet_id = "${module.qubole_vpc.public_subnets[0]}"

  lifecycle {
    ignore_changes = ["subnet_id"]
  }

  tags = {
    Name        = "annalect-dig-bastion-${var.env}"
    env         = "${var.env}"
  }

  user_data = "${data.template_file.user_data.rendered}"
  #iam_instance_profile = "${aws_iam_instance_profile.ec2_instance.name}"
  #associate_public_ip_address = true

#   root_block_device = {
#     volume_type = "gp2"
#     volume_size = 32
#   }
}

data "template_file" "user_data" {
  # system_info:
  # default_user:
  #   name: annalectau
  template = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install ntp -y
              apt-get install ntpstat -y
              ntpq -pcrv
              EOF
}