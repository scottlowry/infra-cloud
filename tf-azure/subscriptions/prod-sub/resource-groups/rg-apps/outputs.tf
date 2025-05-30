output "name" {
  description = "The name of the resource group"
  value       = module.rg-apps.resource_group_name
}

output "location" {
  description = "The location of the resource group"
  value       = module.rg-apps.resource_group_location
}

output "id" {
  description = "The ID of the resource group"
  value       = module.rg-apps.resource_group_id
}