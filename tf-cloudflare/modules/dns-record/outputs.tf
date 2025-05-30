output "cloudflare_dns_record_id" {
  value = cloudflare_dns_record.this.id
}

output "cloudflare_dns_record_created_on" {
  value = cloudflare_dns_record.this.created_on
}

output "cloudflare_dns_record_modified_on" {
  value = cloudflare_dns_record.this.modified_on
}

output "cloudflare_dns_record_name" {
  value = cloudflare_dns_record.this.name
}

output "cloudflare_dns_record_ttl" {
  value = cloudflare_dns_record.this.ttl
}

output "cloudflare_dns_record_type" {
  value = cloudflare_dns_record.this.type
}

output "cloudflare_dns_record_zone_id" {
  value = cloudflare_dns_record.this.zone_id
}

output "cloudflare_dns_record_comment" {
  value = cloudflare_dns_record.this.comment
}

output "cloudflare_dns_record_content" {
  value = cloudflare_dns_record.this.content
}

output "cloudflare_dns_record_priority" {
  value = cloudflare_dns_record.this.priority
}

output "cloudflare_dns_record_proxied" {
  value = cloudflare_dns_record.this.proxied
}