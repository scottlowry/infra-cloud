terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.api_token
}

resource "cloudflare_dns_record" "this" {
  zone_id = var.zone_id
  name = var.name
  type = var.type
  comment = var.comment
  content = var.content
  ttl = var.ttl
  priority = var.priority
  proxied = var.proxied
}