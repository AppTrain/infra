data "aws_route53_zone" "root" {
  name = "${var.root_zone}."
}

resource "aws_route53_record" "qubole_bastion" {
  zone_id = data.aws_route53_zone.root.zone_id
  name    = "${var.subdomain}.$.com"
  type    = "A"
  ttl     = "30"
  records = [aws_eip.bastion.public_ip]
}
