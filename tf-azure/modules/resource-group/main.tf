resource "azurerm_resource_group" "this" {
  name     = var.name
  location = "westus2"
  tags     = var.tags
}