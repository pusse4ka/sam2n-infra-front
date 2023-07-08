resource "aws_cloudfront_distribution" "www_s3_distribution" {
  origin {
    domain_name = aws_s3_bucket.s3-website.website_endpoint
    origin_id   = local.s3_origin_id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.s3-website-origin-identity.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "sam2n front-end application"
  default_root_object = "index.html"

  aliases = ["www.${var.domain_name}"]

  custom_error_response {
    error_caching_min_ttl = 0
    error_code            = 404
    response_code         = 200
    response_page_path    = "/404.html"
  }

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = var.cache_ttl
    default_ttl            = var.cache_ttl
    max_ttl                = var.cache_ttl
    compress               = true
  }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
#    acm_certificate_arn      = aws_acm_certificate_validation.cert_validation.certificate_arn
#    ssl_support_method       = "sni-only"
#    minimum_protocol_version = "TLSv1.1_2016"
    cloudfront_default_certificate = true
  }

  tags = var.common_tags
}

resource "aws_cloudfront_origin_access_identity" "s3-website-origin-identity" {
  comment = "Provides access to sam2n application from edge locations"
}
