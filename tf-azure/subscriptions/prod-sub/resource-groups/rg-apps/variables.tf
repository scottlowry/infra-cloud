variable "name" {
  description = "The name of the resource group"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the resource group"
  type        = map(string)
  default     = {}
}