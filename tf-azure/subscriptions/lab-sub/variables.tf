variable "subscription_id" {
  description = "The subscription ID for the subscription"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {
    sub = "lab"
  }
}