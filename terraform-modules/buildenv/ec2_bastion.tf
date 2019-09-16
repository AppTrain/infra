resource "aws_instance" "bastion" {
  ami           = "${data.aws_ami.ubuntu_1804.image_id}"
  instance_type = "t2.micro"

  vpc_security_group_ids = [
    "${aws_security_group.bastion.id}",
  ]

  key_name  = "${aws_key_pair.entrypoint.key_name}"
  subnet_id = "${module.this_vpc.public_subnets[0]}"

  tags = {
    Name    = "annalect-buildenv-${var.env}-bastion"
    env     = "${var.env}"
    ansible = "${var.env}_bastion"
  }

  #iam_instance_profile = "${aws_iam_instance_profile.ec2_instance.name}"
}

resource "aws_eip" "bastion" {
  instance = "${aws_instance.bastion.id}"
  vpc      = true
}