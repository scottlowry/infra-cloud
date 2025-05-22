variable "location" {
  description = "The location/region for prod resources"
  type        = string
  default     = "westus2"  # This will override the root default if needed
}

variable "tags" {
  description = "Environment-specific tags for prod"
  type        = map(string)
  default     = {
    env = "prod"
  }
} 