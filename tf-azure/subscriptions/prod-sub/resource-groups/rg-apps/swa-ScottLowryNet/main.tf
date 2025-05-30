module "rg-apps" {
  source = "../"

  name = "rg-apps"
  tags = var.tags
}

module "swa-ScottLowryNet" {
  source = "../../../../../modules/static-web-app"

  name                = "ScottLowryNet"
  resource_group_name = module.rg-apps.name
  sku_tier            = "Free"
  sku_size            = "Free"
  repository_branch   = "main"
  repository_url      = "https://github.com/scottlowry/ScottLowryNet"
  repository_token    = var.repository_token
  tags                = merge(var.tags, {
    Application = "ScottLowryNet"
  })
}

module "swacd-wwwScottLowryNet" {
  source = "../../../../../modules/static-web-app-custom-domain"
  
  domain_name = "www.scottlowry.net"
  static_web_app_id = module.swa-ScottLowryNet.static_web_app_id
  validation_type = "cname-delegation"
}