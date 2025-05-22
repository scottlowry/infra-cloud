variable "name" {
  description = "The name of the resource group"
  type        = string
}

variable "tags" {
  type    = map(string)
  default = {}
}