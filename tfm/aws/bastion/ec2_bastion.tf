resource "aws_instance" "bastion" {
  ami           = data.aws_ami.bastion.image_id
  instance_type = var.instance_type

  vpc_security_group_ids = [
    aws_security_group.bastion.id,
  ]

  key_name  = aws_key_pair.bastion.key_name
  subnet_id = var.subnet_id

  tags = {
    Name    = "${var.env}-${var.name}"
    env     = var.env
    purpose = "bastion"
  }
  # ansible     = "${var.env}_bastion"

  #iam_instance_profile = "${aws_iam_instance_profile.ec2_instance.name}"
}

resource "aws_eip" "bastion" {
  instance = aws_instance.bastion.id
  vpc      = true
}

resource "aws_route53_record" "bastion" {
  zone_id = data.aws_route53_zone.external.zone_id
  name    = "${var.name}.${var.env}.out.accuenplatform.com"
  type    = "A"
  ttl     = 300
  records = [aws_eip.bastion.public_ip]
}
