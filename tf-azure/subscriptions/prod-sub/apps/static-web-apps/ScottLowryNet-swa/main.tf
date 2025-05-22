module "scottlowrynet" {
  source = "../../../../modules/static-web-app"

  name                = "ScottLowryNet"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_tier            = "Free"
  sku_size            = "Free"
  repository_url      = "https://github.com/scottlowry/ScottLowryNet"
  repository_token    = var.repository_token
  repository_branch   = "main"
  app_location        = "/www"
  api_location        = ""
  app_artifact_location = "public"
  custom_domains      = ["www.scottlowry.net"]
  tags                = merge(var.tags, {
    Application = "ScottLowryNet"
  })
}
