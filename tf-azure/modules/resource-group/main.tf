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

  subscription_id = var.subscription_id

}

locals {
  all_tags = merge(var.tags, {
    resource_type = "resource_group",
    managed_by = "terraform"
  })
}

resource "azurerm_resource_group" "this" {
  name     = var.name
  location = var.location
  tags     = local.all_tags
}