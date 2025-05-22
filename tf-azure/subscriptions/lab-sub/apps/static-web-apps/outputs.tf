output "static_web_app_id" {
  description = "The ID of the static web app"
  value       = module.scottlowrynet.id
}

output "static_web_app_default_host_name" {
  description = "The default host name of the static web app"
  value       = module.scottlowrynet.default_host_name
}

output "static_web_app_custom_domains" {
  description = "The custom domains of the static web app"
  value       = module.scottlowrynet.custom_domains
}

output "static_web_app_api_key" {
  description = "The API key of the static web app (sensitive)"
  value       = module.scottlowrynet.api_key
  sensitive   = true
}
