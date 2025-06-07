variable "domain_name" {
  description = "The name of the custom domain"
  type        = string
}

variable "static_web_app_id" {
  description = "The ID of the static web app"
  type        = string
}

variable "validation_type" {
  description = "The type of validation to use for the custom domain"
  type        = string
  default     = "cname-delegation"
}

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