resource "aws_route53_record" "dev-admin" {
  zone_id = var.zone_id
  name    = var.name
  type    = var.type
  ttl     = "300"
  records = var.records
}