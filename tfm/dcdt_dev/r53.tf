

data "aws_route53_zone" "dev" {
  name         = "dev1.in.accuenplatform.com."
  private_zone = true
}

resource "aws_route53_record" "public" {
  zone_id = var.zone_id
  name    = var.dns_name
  type    = "A"
  ttl     = 300
  records = [aws_instance.this.public_ip]
}

resource "aws_route53_record" "private" {
  zone_id = data.aws_route53_zone.dev.zone_id
  name    = "${var.host_name}.dev1.in.accuenplatform.com"
  type    = "A"
  ttl     = 300
  records = [aws_instance.this.private_ip]
}
