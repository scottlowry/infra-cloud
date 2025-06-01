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

module "plinkercad_com_records" {
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
      name     = "plinkercad.com"
      type     = "A"
      comment  = null
      priority = null
      content  = "192.0.2.1"
      ttl      = 1
      proxied  = true
    }
    a_www = {
      name     = "www"
      type     = "A"
      comment  = null
      priority = null
      content  = "192.0.2.1"
      ttl      = 1
      proxied  = true
    }
    a_ebay = {
      name     = "ebay"
      type     = "A"
      comment  = null
      priority = null
      content  = "192.0.2.1"
      ttl      = 1
      proxied  = true
    }
    a_etsy = {
      name     = "etsy"
      type     = "A"
      comment  = null
      priority = null
      content  = "192.0.2.1"
      ttl      = 1
      proxied  = true
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
    cname_k5a = {
      name     = "k5a._domainkey"
      type     = "CNAME"
      comment  = null
      priority = null
      content  = "dkim1.b4360477b1cf.p180.email.myshopify.com"
      ttl      = 1
      proxied  = false
    }
    cname_k5a2 = {
      name     = "k5a2._domainkey"
      type     = "CNAME"
      comment  = null
      priority = null
      content  = "dkim2.b4360477b1cf.p180.email.myshopify.com"
      ttl      = 1
      proxied  = false
    }
    cname_k5a3 = {
      name     = "k5a3._domainkey"
      type     = "CNAME"
      comment  = null
      priority = null
      content  = "dkim3.b4360477b1cf.p180.email.myshopify.com"
      ttl      = 1
      proxied  = false
    }
    cname_mailerk5a = {
      name     = "mailerk5a"
      type     = "CNAME"
      comment  = null
      priority = null
      content  = "b4360477b1cf.p180.email.myshopify.com"
      ttl      = 1
      proxied  = false
    }
    cname_selector1 = {
      name     = "selector1._domainkey"
      type     = "CNAME"
      comment  = null
      priority = null
      content  = "selector1-plinkercad-com._domainkey.scottlowry.onmicrosoft.com"
      ttl      = 3600
      proxied  = false
    }
    cname_selector2 = {
      name     = "selector2._domainkey"
      type     = "CNAME"
      comment  = null
      priority = null
      content  = "selector2-plinkercad-com._domainkey.scottlowry.onmicrosoft.com"
      ttl      = 3600
      proxied  = false
    }
    cname_shopify = {
      name     = "shopify"
      type     = "CNAME"
      comment  = null
      priority = null
      content  = "shops.myshopify.com"
      ttl      = 1
      proxied  = false
    }
    mx_outlook = {
     name     = "plinkercad.com"
      type     = "MX"
      comment  = null
      priority = 0
      content  = "plinkercad-com.mail.protection.outlook.com"
      ttl      = 3600
      proxied  = false
    }
    txt_spf = {
      name     = "plinkercad.com"
      type     = "TXT"
      comment  = null
      priority = null
      content  = "\"v=spf1 include:spf.protection.outlook.com -all\""
      ttl      = 3600
      proxied  = false
    }
  }
}