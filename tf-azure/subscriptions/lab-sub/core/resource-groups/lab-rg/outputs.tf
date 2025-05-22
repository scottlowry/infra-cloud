output "apps_rg_id" {
  description = "The ID of the apps resource group"
  value       = module.apps.id
}

output "apps_rg_name" {
  description = "The name of the apps resource group"
  value       = module.apps.name
}

output "logs_rg_id" {
  description = "The ID of the logs resource group"
  value       = module.logs.id
}

output "logs_rg_name" {
  description = "The name of the logs resource group"
  value       = module.logs.name
} 