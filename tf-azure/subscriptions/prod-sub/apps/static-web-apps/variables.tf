variable "location" {
  description = "The location/region for the static web app"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the static web app"
  type        = map(string)
}

variable "resource_group_name" {
  description = "The name of the resource group where the static web app will be created"
  type        = string
}

variable "repository_token" {
  description = "GitHub personal access token for repository access"
  type        = string
  sensitive   = true
}
