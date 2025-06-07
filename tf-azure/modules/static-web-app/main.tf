terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}

  tenant_id = var.tenant_id
  subscription_id = var.subscription_id
  client_id = var.client_id
  client_secret = var.client_secret
  resource_provider_registrations = "none"
}

locals {
  all_tags = merge(var.tags, {
    resource_type = "static_web_app",
    managed_by = "terraform"
  })
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
  tags                = local.all_tags
}