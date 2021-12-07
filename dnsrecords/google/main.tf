variable project { default = "shared-vpc-host-b264" }
variable record {}
variable value { 
#default = []
#type = list(string)
 }
#variable zonename {}
#variable managed-zone {}
data "google_dns_managed_zone" "gcp_dns_zone" {
  name		= "magento"
  project	= var.project
}

resource "google_dns_record_set" "arecord" {
  name		= var.record
  project	= var.project
  managed_zone	= "magento"
  type		= "A"
  ttl		= "60"
  rrdatas	= var.value
}


output "dns" {
  value         = data.google_dns_managed_zone.gcp_dns_zone.name
}

