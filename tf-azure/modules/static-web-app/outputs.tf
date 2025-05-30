output "static_web_app_name" {
  description = "The name of the static web app"
  value       = azurerm_static_web_app.this.name
}

output "static_web_app_location" {
  description = "The location of the static web app"
  value       = azurerm_static_web_app.this.location
}

output "static_web_app_resource_group_name" {
  description = "The name of the resource group where the static web app will be created"
  value       = azurerm_static_web_app.this.resource_group_name
}

output "static_web_app_id" {
  description = "The ID of the static web app"
  value       = azurerm_static_web_app.this.id
}

output "static_web_app_api_key" {
  description = "The API key of the static web app"
  value       = azurerm_static_web_app.this.api_key
  sensitive   = true
}

output "static_web_app_default_host_name" {
  description = "The default host name of the static web app"
  value       = azurerm_static_web_app.this.default_host_name
}