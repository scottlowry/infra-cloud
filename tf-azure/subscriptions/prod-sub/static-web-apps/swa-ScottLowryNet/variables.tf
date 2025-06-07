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
