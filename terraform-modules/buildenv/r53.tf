resource "aws_route53_zone" "internal" {
  name = "${var.env}.in.accuenplatform.com."
  vpc {
    vpc_id = "${module.this_vpc.vpc_id}"
  }

  tags = {
    zone        = "${var.env}.in.accuenplatform.com"
    Environment = "${var.env}"
  }
}

resource "aws_route53_zone" "external" {
  name = "${var.env}.out.accuenplatform.com."

  tags = {
    zone        = "${var.env}.out.accuenplatform.com"
    Environment = "${var.env}"
  }
}

resource "aws_route53_record" "bastion" {
  zone_id = "${aws_route53_zone.external.zone_id}"
  name    = "entrypoint.${var.env}.out.accuenplatform.com"
  type    = "A"
  ttl     = 300
  records = ["${aws_eip.bastion.public_ip}"]
}