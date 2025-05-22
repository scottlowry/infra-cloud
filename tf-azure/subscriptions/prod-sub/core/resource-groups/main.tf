terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

module "apps" {
  source = "./apps"
  tags   = var.tags
}

module "logs" {
  source = "./logs"
  tags   = var.tags
}