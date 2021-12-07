variable magento-zone {}
variable dns_name {}
variable project {}

resource "google_dns_managed_zone" "spriizone" {
  name        = var.magento-zone
  dns_name    = var.dns_name
  description = "sprii private DNS zone"
  project     = var.project
  visibility  = "private"
  labels = {
    foo = "bar"
  }
}

output "dns" {
  value         = google_dns_managed_zone.spriizone.name
}

