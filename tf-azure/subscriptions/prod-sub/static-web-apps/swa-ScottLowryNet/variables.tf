variable "subscription_id" {
  description = "The ID of the subscription where the static web app will be created"
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
