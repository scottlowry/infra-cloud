variable "api_token" {
  description = "The API token of the Cloudflare account"
  type        = string
  sensitive   = true
}

variable "zone_id" {
  description = "The zone ID of the DNS record"
  type        = string
  sensitive   = true
}