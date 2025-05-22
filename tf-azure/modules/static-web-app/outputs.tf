output "static_web_app_id" {
  description = "The ID of the static web app"
  value       = azurerm_static_web_app.this.id
}

output "static_web_app_default_host_name" {
  description = "The default host name of the static web app"
  value       = azurerm_static_web_app.this.default_host_name
}

output "static_web_app_api_key" {
  description = "The API key of the static web app"
  value       = azurerm_static_web_app.this.api_key
  sensitive   = true
}

output "static_web_app_custom_domains" {
  description = "The custom domains of the static web app"
  value       = { for k, v in azurerm_static_web_app_custom_domain.this : k => v.domain_name }
}
