resource "aws_instance" "bastion" {
  ami           = "${data.aws_ami.ubuntu_1804.image_id}"
  instance_type = "t2.micro"

  vpc_security_group_ids = [
    "${aws_security_group.bastion.id}",
  ]
  
  key_name  = "${aws_key_pair.bastion.key_name}"
  subnet_id = "${module.this_vpc.public_subnets[0]}"

  tags = {
    Name        = "annalect-${var.env}-bastion"
    env         = "${var.env}"
    ansible     = "${var.env}_bastion"
  }

  #iam_instance_profile = "${aws_iam_instance_profile.ec2_instance.name}"
}

resource "aws_eip" "bastion" {
    instance = "${aws_instance.bastion.id}"
    vpc = true
}

resource "aws_route53_record" "bastion" {
  zone_id = "${aws_route53_zone.external.zone_id}"
  name    = "bastion.${var.env}.out.accuenplatform.com"
  type    = "A"
  ttl     = 300
  records = ["${aws_eip.bastion.public_ip}"]
}