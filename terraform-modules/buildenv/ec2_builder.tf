# resource "aws_instance" "builder" {
#   ami           = "${data.aws_ami.buildenv.image_id}"
#   instance_type = "m5.xlarge"
#   count = "${var.builder_count}"

#   vpc_security_group_ids = [
#     "${aws_security_group.builder.id}",
#   ]
  
#   key_name  = "${aws_key_pair.ansible.key_name}"
#   subnet_id = "${module.this_vpc.private_subnets[0]}"

#   # lifecycle {
#   #   ignore_changes = ["subnet_id"]
#   # }

#   tags = {
#     Name        = "annalect-buildenv-${var.env}-${count.index}"
#     env         = "${var.env}"
#     ansible     = "${var.env}_buildenv"
#   }

#   #user_data = "${data.template_file.user_data.rendered}"
#   #iam_instance_profile = "${aws_iam_instance_profile.ec2_instance.name}"
#   #associate_public_ip_address = false

# #   root_block_device = {
# #     volume_type = "gp2"
# #     volume_size = 32
# #   }
# }

# # data "template_file" "user_data" {
# #   # system_info:
# #   # default_user:
# #   #   name: annalectau
# #   template = <<-EOF
# #               #!/bin/bash
# #               apt-get update -y
# #               apt-get install ntp -y
# #               apt-get install ntpstat -y
# #               ntpq -pcrv
# #               EOF
# # }