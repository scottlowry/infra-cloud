module "scottlowry_net_a_root" {
  source = "../modules/dns-record"
  
  api_token = var.api_token
  zone_id = var.zone_id
  name    = "scottlowry.net"
  type    = "A"
  comment = null
  priority = null
  content = "192.0.2.1"
  ttl     = 1
  proxied = true
}

module "scottlowry_net_a_lan" {
  source = "../modules/dns-record"
  
  api_token = var.api_token
  zone_id = var.zone_id
  name    = "lan"
  type    = "A"
  comment = null
  priority = null
  content = "76.27.198.182"
  ttl     = 1
  proxied = false
}

module "scottlowry_net_cname_autodiscover" {
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

module "scottlowry_net_cname_enterpriseenrollment" {
  source = "../modules/dns-record"
  
  api_token = var.api_token
  zone_id = var.zone_id
  name    = "enterpriseenrollment"
  type    = "CNAME"
  comment = null
  priority = null
  content = "enterpriseenrollment-s.manage.microsoft.com"
  ttl     = 3600
  proxied = false
}

module "scottlowry_net_cname_enterpriseregistration" {
  source = "../modules/dns-record"
  
  api_token = var.api_token
  zone_id = var.zone_id
  name    = "enterpriseregistration"
  type    = "CNAME"
  comment = null
  priority = null
  content = "enterpriseregistration.windows.net"
  ttl     = 3600
  proxied = false
}

module "scottlowry_net_cname_selector1" {
  source = "../modules/dns-record"
  
  api_token = var.api_token
  zone_id = var.zone_id
  name    = "selector1._domainkey"
  type    = "CNAME"
  comment = null
  priority = null
  content = "selector1-scottlowry-net._domainkey.scottlowry.onmicrosoft.com"
  ttl     = 3600
  proxied = false
}

module "scottlowry_net_cname_selector2" {
  source = "../modules/dns-record"
  
  api_token = var.api_token
  zone_id = var.zone_id
  name    = "selector2._domainkey"
  type    = "CNAME"
  comment = null
  priority = null
  content = "selector2-scottlowry-net._domainkey.scottlowry.onmicrosoft.com"
  ttl     = 3600
  proxied = false
}

module "scottlowry_net_cname_ssh" {
  source = "../modules/dns-record"
  
  api_token = var.api_token
  zone_id = var.zone_id
  name    = "ssh"
  type    = "CNAME"
  comment = null
  priority = null
  content = "bc0db93a-fd22-4c20-9158-4e8542bdd9bc.cfargotunnel.com"
  ttl     = 1
  proxied = true
}

module "scottlowry_net_cname_vnc" {
  source = "../modules/dns-record"
  
  api_token = var.api_token
  zone_id = var.zone_id
  name    = "vnc"
  type    = "CNAME"
  comment = null
  priority = null
  content = "bc0db93a-fd22-4c20-9158-4e8542bdd9bc.cfargotunnel.com"
  ttl     = 1
  proxied = true
}

module "scottlowry_net_cname_www" {
  source = "../modules/dns-record"
  
  api_token = var.api_token
  zone_id = var.zone_id
  name    = "www"
  type    = "CNAME"
  comment = null
  priority = null
  content = "agreeable-tree-0f0c02a1e.6.azurestaticapps.net"
  ttl     = 1
  proxied = false
}

module "scottlowry_net_mx_outlook" {
  source = "../modules/dns-record"
  
  api_token = var.api_token
  zone_id  = var.zone_id
  name     = "scottlowry.net"
  type     = "MX"
  comment = null
  content  = "scottlowry-net.mail.protection.outlook.com"
  priority = 0
  ttl      = 3600
  proxied = false
}

module "scottlowry_net_txt_spf" {
  source = "../modules/dns-record"
  
  api_token = var.api_token
  zone_id = var.zone_id
  name    = "scottlowry.net"
  type    = "TXT"
  comment = null
  priority = null
  content = "\"v=spf1 include:spf.protection.outlook.com -all\""
  ttl     = 3600
  proxied = false
}