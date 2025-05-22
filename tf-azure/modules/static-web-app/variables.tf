variable "name" {
  description = "The name of the static web app"
  type        = string
}

variable "location" {
  description = "The location/region where the static web app will be created"
  type        = string
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

variable "repository_url" {
  description = "The URL of the GitHub repository to deploy"
  type        = string
}

variable "repository_token" {
  description = "Repository Token with admin privileges"
  type        = string
  sensitive   = true
}

variable "repository_branch" {
  description = "The branch of the repository to deploy"
  type        = string
  default     = "main"
}

variable "app_location" {
  description = "The location of the app code in the repository"
  type        = string
  default     = "/"
}

variable "api_location" {
  description = "The location of the API code in the repository"
  type        = string
  default     = "api"
}

variable "app_artifact_location" {
  description = "The location of the app artifacts in the repository"
  type        = string
  default     = "build"
}

variable "custom_domains" {
  description = "List of custom domains to add to the static web app"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to apply to the static web app"
  type        = map(string)
  default     = {}
}
