variable domain_name {}
variable internal_domain { default = false }
variable record {}
variable type { default = "A" }
variable ttl { default = "300" }
variable value {
type    = list(string)
}

data "aws_route53_zone" "domain" {
  name         = var.domain_name
  private_zone = var.internal_domain
}


resource "aws_route53_record" "custom-record" {
  zone_id = data.aws_route53_zone.domain.zone_id
  name    = var.record
  type    = var.type
  ttl     = var.ttl
  records = [var.value[0]]
}


output "fqdn" {
  value = aws_route53_record.custom-record.fqdn
}

