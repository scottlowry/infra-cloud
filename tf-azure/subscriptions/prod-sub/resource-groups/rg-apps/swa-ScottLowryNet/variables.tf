variable "name" {
  description = "The name of the static web app"
  type        = string
}

variable "location" {
  description = "The location/region where the static web app will be created"
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
