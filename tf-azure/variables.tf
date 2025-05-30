variable "location" {
  description = "The default location/region for all resources"
  type        = string
  default     = "westus2"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {
    managed_by = "terraform"
  }
}