variable "location" {
  description = "The location/region where the static web app will be created"
  type        = string
  default     = "westus2"
}

variable "resource_group_name" {
  description = "The name of the resource group where the static web app will be created"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {
    env = "lab"
  }
}

variable "repository_token" {
  description = "GitHub personal access token for repository access"
  type        = string
  sensitive   = true
}
