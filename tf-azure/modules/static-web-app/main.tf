terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

resource "azurerm_static_web_app" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_tier            = var.sku_tier
  sku_size            = var.sku_size
  repository_branch   = var.repository_branch
  repository_url      = var.repository_url
  repository_token    = var.repository_token
  tags                = merge(var.tags, {
    resource_type = "static_web_app"
  })
}