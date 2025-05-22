terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

module "static_web_apps" {
  source = "../../../../modules/static-web-app"
  for_each = toset(["ScottLowryNet"])

  name                = each.key
  location            = var.location
  tags                = var.tags
  resource_group_name = var.resource_group_name
  repository_token    = var.repository_token
  repository_url      = "https://github.com/scottlowry/ScottLowryNet"
  repository_branch   = "main"
  app_location        = "/www"
  api_location        = ""
  app_artifact_location = "public"
  custom_domains      = ["www.scottlowry.net"]
  sku_tier            = "Free"
  sku_size            = "Free"
}