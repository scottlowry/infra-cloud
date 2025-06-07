module "rg-apps" {
  source = "../../../../modules/resource-group"

  subscription_id = var.subscription_id
  tenant_id = var.tenant_id
  client_id = var.client_id
  client_secret = var.client_secret

  name = "rg-apps"
}

module "swa-ScottLowryNet" {
  source = "../../../../modules/static-web-app"

  subscription_id = var.subscription_id
  tenant_id = var.tenant_id
  client_id = var.client_id
  client_secret = var.client_secret

  name                = "ScottLowryNet"
  resource_group_name = module.rg-apps.resource_group_name
  sku_tier            = "Free"
  sku_size            = "Free"
  repository_branch   = "main"
  repository_url      = "https://github.com/scottlowry/ScottLowryNet"
  repository_token    = var.repository_token
  tags                = {
    application = "ScottLowryNet"
  }
}

module "swacd-wwwScottLowryNet" {
  source = "../../../../modules/static-web-app-custom-domain"
  
  subscription_id = var.subscription_id
  tenant_id = var.tenant_id
  client_id = var.client_id
  client_secret = var.client_secret

  domain_name = "www.scottlowry.net"
  static_web_app_id = module.swa-ScottLowryNet.static_web_app_id
  validation_type = "cname-delegation"
}