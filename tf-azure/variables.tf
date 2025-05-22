variable "repository_token" {
  description = "GitHub personal access token for repository access"
  type        = string
  sensitive   = true
}

variable "location" {
  description = "The default location/region for all resources"
  type        = string
  default     = "westus2"
}

variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {
    managed_by = "terraform"
  }
}