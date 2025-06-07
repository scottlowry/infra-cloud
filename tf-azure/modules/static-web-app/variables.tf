variable "tenant_id" {
  description = "The ID of the tenant where the resource group will be created"
  type        = string
  sensitive   = true
}

variable "subscription_id" {
  description = "The ID of the subscription where the resource group will be created"
  type        = string
  sensitive   = true
}

variable "client_id" {
  description = "The ID of the client where the resource group will be created"
  type        = string
  sensitive   = true
}

variable "client_secret" {
  description = "The secret of the client where the resource group will be created"
  type        = string
  sensitive   = true
}

variable "name" {
  description = "The name of the static web app"
  type        = string
}

variable "location" {
  description = "The location/region where the static web app will be created"
  type        = string
  default     = "westus2"
}

variable "resource_group_name" {
  description = "The name of the resource group where the static web app will be created"
  type        = string
}

variable "sku_tier" {
  description = "The tier of the static web app (Free or Standard)"
  type        = string
  default     = "Free"
}

variable "sku_size" {
  description = "The size of the static web app (Free or Standard)"
  type        = string
  default     = "Free"
}

variable "repository_branch" {
  description = "The branch of the repository to deploy"
  type        = string
  default     = "main"
}

variable "repository_url" {
  description = "The URL of the GitHub repository to deploy"
  type        = string
}

variable "repository_token" {
  description = "Repository Token with admin privileges"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags to apply to the static web app"
  type        = map(string)
  default     = {}
}
