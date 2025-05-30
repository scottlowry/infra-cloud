module "plinkercad_com_a_root" {
  source = "../modules/dns-record"

  api_token = var.api_token
  zone_id = var.zone_id
  name    = "plinkercad.com"
  type    = "A"
  comment = null
  priority = null
  content = "192.0.2.1"
  ttl     = 1
  proxied = true
}

module "plinkercad_com_a_www" {
  source = "../modules/dns-record"

  api_token = var.api_token
  zone_id = var.zone_id
  name    = "www"
  type    = "A"
  comment = null
  priority = null
  content = "192.0.2.1"
  ttl     = 1
  proxied = true
}

module "plinkercad_com_a_ebay" {
  source = "../modules/dns-record"
  
  api_token = var.api_token
  zone_id = var.zone_id
  name    = "ebay"
  type    = "A"
  comment = null
  priority = null
  content = "192.0.2.1"
  ttl     = 1
  proxied = true
}

module "plinkercad_com_a_etsy" {
  source = "../modules/dns-record"
  
  api_token = var.api_token
  zone_id = var.zone_id
  name    = "etsy"
  type    = "A"
  comment = null
  priority = null
  content = "192.0.2.1"
  ttl     = 1
  proxied = true
}

module "plinkercad_com_cname_autodiscover" {
  source = "../modules/dns-record"
  
  api_token = var.api_token
  zone_id = var.zone_id
  name    = "autodiscover"
  type    = "CNAME"
  comment = null
  priority = null
  content = "autodiscover.outlook.com"
  ttl     = 3600
  proxied = false
}

module "plinkercad_com_cname_k5a" {
  source = "../modules/dns-record"

  api_token = var.api_token
  zone_id = var.zone_id
  name    = "k5a._domainkey"
  type    = "CNAME"
  comment = null
  priority = null
  content = "dkim1.b4360477b1cf.p180.email.myshopify.com"
  ttl     = 1
  proxied = false
}

module "plinkercad_com_cname_k5a2" {
  source = "../modules/dns-record"
  
  api_token = var.api_token
  zone_id = var.zone_id
  name    = "k5a2._domainkey"
  type    = "CNAME"
  comment = null
  priority = null
  content = "dkim2.b4360477b1cf.p180.email.myshopify.com"
  ttl     = 1
  proxied = false
}

module "plinkercad_com_cname_k5a3" {
  source = "../modules/dns-record"
  
  api_token = var.api_token
  zone_id = var.zone_id
  name    = "k5a3._domainkey"
  type    = "CNAME"
  comment = null
  priority = null
  content = "dkim3.b4360477b1cf.p180.email.myshopify.com"
  ttl     = 1
  proxied = false
}

module "plinkercad_com_cname_mailerk5a" {
  source = "../modules/dns-record"
  
  api_token = var.api_token
  zone_id = var.zone_id
  name    = "mailerk5a"
  type    = "CNAME"
  comment = null
  priority = null
  content = "b4360477b1cf.p180.email.myshopify.com"
  ttl     = 1
  proxied = false
}

module "plinkercad_com_cname_selector1" {
  source = "../modules/dns-record"
  
  api_token = var.api_token
  zone_id = var.zone_id
  name    = "selector1._domainkey"
  type    = "CNAME"
  comment = null
  priority = null
  content = "selector1-plinkercad-com._domainkey.scottlowry.onmicrosoft.com"
  ttl     = 3600
  proxied = false
}

module "plinkercad_com_cname_selector2" {
  source = "../modules/dns-record"
  
  api_token = var.api_token
  zone_id = var.zone_id
  name    = "selector2._domainkey"
  type    = "CNAME"
  comment = null
  priority = null
  content = "selector2-plinkercad-com._domainkey.scottlowry.onmicrosoft.com"
  ttl     = 3600
  proxied = false
}

module "plinkercad_com_cname_shopify" {
  source = "../modules/dns-record"
  
  api_token = var.api_token
  zone_id = var.zone_id
  name    = "shopify"
  type    = "CNAME"
  comment = null
  priority = null
  content = "shops.myshopify.com"
  ttl     = 1
  proxied = false
}

module "plinkercad_com_mx_outlook" {
  source = "../modules/dns-record"
  
  api_token = var.api_token
  zone_id  = var.zone_id
  name     = "plinkercad.com"
  type     = "MX"
  comment = null
  content  = "plinkercad-com.mail.protection.outlook.com"
  priority = 0
  ttl      = 3600
  proxied = false
}

module "plinkercad_com_txt_spf" {
  source = "../modules/dns-record"
  
  api_token = var.api_token
  zone_id = var.zone_id
  name    = "plinkercad.com"
  type    = "TXT"
  comment = null
  priority = null
  content = "\"v=spf1 include:spf.protection.outlook.com -all\""
  ttl     = 3600
  proxied = false
}