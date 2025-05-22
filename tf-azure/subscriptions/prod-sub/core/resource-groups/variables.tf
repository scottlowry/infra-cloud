variable "tags" {
  description = "Tags to be applied to the resource group"
  type        = map(string)
  default     = {
    env = "prod"
  }
} 