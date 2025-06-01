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

module "scottlowry_net_records" {
  source    = "../modules/dns-record"
  for_each  = local.dns_records
  
  zone_id   = var.zone_id
  name      = each.value.name
  type      = each.value.type
  content   = each.value.content
  ttl       = each.value.ttl
  proxied   = each.value.proxied
  comment   = each.value.comment
  priority  = each.value.priority
}

locals {
  dns_records = {
    a_root = {
      name     = "scottlowry.net"
      type     = "A"
      comment  = null
      priority = null
      content  = "192.0.2.1"
      ttl      = 1
      proxied  = true
    }
    a_lan = {
      name     = "lan"
      type     = "A"
      comment  = null
      priority = null
      content  = "76.27.198.182"
      ttl      = 1
      proxied  = false
    }
    cname_autodiscover = {
      name     = "autodiscover"
      type     = "CNAME"
      comment  = null
      priority = null
      content  = "autodiscover.outlook.com"
      ttl      = 3600
      proxied  = false
    }
    cname_enterpriseenrollment = {
      name     = "enterpriseenrollment"
      type     = "CNAME"
      comment  = null
      priority = null
      content  = "enterpriseenrollment-s.manage.microsoft.com"
      ttl      = 3600
      proxied  = false
    }
    cname_enterpriseregistration = {
      name     = "enterpriseregistration"
      type     = "CNAME"
      comment  = null
      priority = null
      content  = "enterpriseregistration.windows.net"
      ttl      = 3600
      proxied  = false
    }
    cname_selector1 = {
      name     = "selector1._domainkey"
      type     = "CNAME"
      comment  = null
      priority = null
      content  = "selector1-scottlowry-net._domainkey.scottlowry.onmicrosoft.com"
      ttl      = 3600
      proxied  = false
    }
    cname_selector2 = {
      name     = "selector2._domainkey"
      type     = "CNAME"
      comment  = null
      priority = null
      content  = "selector2-scottlowry-net._domainkey.scottlowry.onmicrosoft.com"
      ttl      = 3600
      proxied  = false
    }
    cname_ssh = {
      name     = "ssh"
      type     = "CNAME"
      comment  = null
      priority = null
      content  = "bc0db93a-fd22-4c20-9158-4e8542bdd9bc.cfargotunnel.com"
      ttl      = 1
      proxied  = true
    }
    cname_vnc = {
      name     = "vnc"
      type     = "CNAME"
      comment  = null
      priority = null
      content  = "bc0db93a-fd22-4c20-9158-4e8542bdd9bc.cfargotunnel.com"
      ttl      = 1
      proxied  = true
    }
    cname_www = {
      name     = "www"
      type     = "CNAME"
      comment  = null
      priority = null
      content  = "agreeable-tree-0f0c02a1e.6.azurestaticapps.net"
      ttl      = 1
      proxied  = false
    }
    mx_outlook = {
      name     = "scottlowry.net"
      type     = "MX"
      comment  = null
      priority = 0
      content  = "scottlowry-net.mail.protection.outlook.com"
      ttl      = 3600
      proxied  = false
    }
    txt_spf = {
      name     = "scottlowry.net"
      type     = "TXT"
      comment  = null
      priority = null
      content  = "\"v=spf1 include:spf.protection.outlook.com -all\""
      ttl      = 3600
      proxied  = false
    }
  }
}