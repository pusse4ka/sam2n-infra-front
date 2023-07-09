variable "domain_name" {
  type        = string
  description = "The domain name for the website."
}

variable "bucket_name" {
  type        = string
  description = "The name of the bucket where the website will be hosted"
}

variable "cache_ttl" {
  type        = number
  default     = 31536000
  description = "Cache TTL for CloudFront distribution"
}

variable "common_tags" {
  description = "Common tags applied to all components."
  default = {
    Terraform        = true
    DeveloperManaged = true
  }
}