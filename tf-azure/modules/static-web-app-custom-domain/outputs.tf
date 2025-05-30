output "static_web_app_custom_domain_name" {
  description = "The name of the static web app custom domain"
  value       = azurerm_static_web_app_custom_domain.this.domain_name
}

output "static_web_app_id" {
  description = "The ID of the static web app"
  value       = azurerm_static_web_app_custom_domain.this.static_web_app_id
}

output "static_web_app_custom_domain_id" {
  description = "The ID of the static web app custom domain"
  value       = azurerm_static_web_app_custom_domain.this.id
}

output "static_web_app_custom_domain_validation_type" {
  description = "The validation type for the static web app custom domain"
  value       = azurerm_static_web_app_custom_domain.this.validation_type
}

output "static_web_app_custom_domain_validation_token" {
  description = "The validation token for the static web app custom domain TXT record"
  value       = azurerm_static_web_app_custom_domain.this.validation_token
}