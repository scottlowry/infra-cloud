output "rg_apps_name" {
  description = "The name of the resource group"
  value       = module.rg-apps.name
}

output "rg_apps_location" {
  description = "The location of the resource group"
  value       = module.rg-apps.location
}

output "rg_apps_id" {
  description = "The ID of the resource group"
  value       = module.rg-apps.id
}

output "name" {
  description = "The name of the static web app"
  value       = module.swa-ScottLowryNet.static_web_app_name
}

output "location" {
  description = "The location of the static web app"
  value       = module.swa-ScottLowryNet.static_web_app_location
}

output "resource_group_name" {
  description = "The name of the resource group where the static web app will be created"
  value       = module.swa-ScottLowryNet.static_web_app_resource_group_name
}

output "id" {
  description = "The ID of the static web app"
  value       = module.swa-ScottLowryNet.static_web_app_id
}

output "api_key" {
  description = "The API key of the static web app"
  value       = module.swa-ScottLowryNet.static_web_app_api_key
  sensitive   = true
}

output "default_host_name" {
  description = "The default host name of the static web app"
  value       = module.swa-ScottLowryNet.static_web_app_default_host_name
}

output "custom_domain_name" {
  description = "The custom domain name"
  value       = module.swacd-wwwScottLowryNet.static_web_app_custom_domain_name
}

output "custom_domain_id" {
  description = "The ID of the static web app custom domain"
  value       = module.swacd-wwwScottLowryNet.static_web_app_custom_domain_id
}

output "custom_domain_validation_token" {
  description = "The validation token for the custom domain"
  value       = module.swacd-wwwScottLowryNet.static_web_app_custom_domain_validation_token
  sensitive   = true
}

