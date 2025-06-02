variable "subscription_id" {
  description = "The ID of the subscription where the resource group will be created"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the resource group"
  type        = map(string)
  default     = {}
}