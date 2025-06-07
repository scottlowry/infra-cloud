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

resource "azurerm_static_web_app_custom_domain" "this" {
  static_web_app_id = var.static_web_app_id
  domain_name       = var.domain_name
  validation_type   = var.validation_type
}