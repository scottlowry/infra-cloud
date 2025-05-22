resource "azurerm_static_web_app" "this" {
  name                = var.name
  location            = "westus2"
  resource_group_name = var.resource_group_name
  sku_tier            = "Free"
  sku_size            = "Free"
  tags                = var.tags
}

resource "azurerm_static_web_app_custom_domain" "this" {
  for_each = toset(var.custom_domains)

  static_web_app_id = azurerm_static_web_app.this.id
  domain_name       = each.value
  validation_type   = "cname-delegation"
}
