variable "name" {
  description = "The name of the DNS record"
  type        = string
}

variable "ttl" {
  description = "The TTL of the DNS record"
  type        = number
}

variable "type" {
  description = "The type of the DNS record"
  type        = string
}

variable "zone_id" {
  description = "The zone ID of the DNS record"
  type        = string
  sensitive   = true
}

variable "comment" {
  description = "The comment of the DNS record"
  type        = string
  default     = null
}

variable "content" {
  description = "The content of the DNS record"
  type        = string
}

variable "priority" {
  description = "The priority of the DNS record"
  type        = number
  default     = null
}

variable "proxied" {
  description = "Whether the DNS record is proxied"
  type        = bool
}