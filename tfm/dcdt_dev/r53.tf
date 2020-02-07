
resource "aws_route53_record" "builder" {
  zone_id = var.zone_id
  name    = var.dns_name
  type    = "A"
  ttl     = 300
  records = [aws_instance.this.public_ip]
}
