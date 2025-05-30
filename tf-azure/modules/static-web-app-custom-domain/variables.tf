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