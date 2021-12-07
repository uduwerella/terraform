variable zoneid {}
variable name {}
variable value {}
variable type {}
variable proxied {}

resource "cloudflare_record" "record" {
  zone_id = var.zoneid
  name    = var.name
  value   = var.value
  type    = var.type
  proxied = var.proxied
}

output "fqdn" {
  value = cloudflare_record.record.hostname
}
