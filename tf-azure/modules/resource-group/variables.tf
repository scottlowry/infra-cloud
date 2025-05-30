variable "name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location/region where the resource group will be created"
  type        = string
  default     = "westus2"
}

variable "tags" {
  type    = map(string)
  default = {}
}