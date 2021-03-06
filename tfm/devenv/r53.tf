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

data "aws_route53_zone" "main" {
  name = "accuenplatform.com."
}

resource "aws_route53_zone" "external" {
  name = "${var.env}.out.accuenplatform.com."

  tags = {
    zone        = "${var.env}.out.accuenplatform.com"
    Environment = "${var.env}"
  }
}

resource "aws_route53_record" "external-ns" {
  zone_id = "${data.aws_route53_zone.main.zone_id}"
  name    = "${var.env}.out.accuenplatform.com"
  type    = "NS"
  ttl     = "30"

  records = [
    "${aws_route53_zone.external.name_servers.0}",
    "${aws_route53_zone.external.name_servers.1}",
    "${aws_route53_zone.external.name_servers.2}",
    "${aws_route53_zone.external.name_servers.3}",
  ]
}
