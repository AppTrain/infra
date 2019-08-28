data "aws_route53_zone" "main" {
  name = "accuenplatform.com."
}

resource "aws_route53_zone" "external" {
  name = "${local.env}.out.accuenplatform.com."

  tags = {
    zone        = "${local.env}.out.accuenplatform.com"
    Environment = "${local.env}"
  }
}

resource "aws_route53_record" "external-ns" {
  zone_id = "${data.aws_route53_zone.main.zone_id}"
  name    = "${local.env}.out.accuenplatform.com"
  type    = "NS"
  ttl     = "30"

  records = [
    "${aws_route53_zone.external.name_servers.0}",
    "${aws_route53_zone.external.name_servers.1}",
    "${aws_route53_zone.external.name_servers.2}",
    "${aws_route53_zone.external.name_servers.3}",
  ]
}