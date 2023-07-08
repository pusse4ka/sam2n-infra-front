data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.s3-website.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.s3-website-origin-identity.iam_arn]
    }
  }
}

resource "aws_s3_bucket" "s3-website" {
  bucket = var.bucket_name
  tags   = var.common_tags
}

resource "aws_s3_bucket_policy" "s3-website-policy" {
  bucket = aws_s3_bucket.s3-website.id
  policy = data.aws_iam_policy_document.s3_policy.json
}

resource "aws_s3_bucket_acl" "s3-website-acl" {
  bucket = aws_s3_bucket.s3-website.id
  acl    = "private"
}

resource "aws_s3_bucket_cors_configuration" "s3-website-cors" {
  bucket = aws_s3_bucket.s3-website.bucket

  cors_rule {
    allowed_headers = ["Authorization", "Content-Length"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["https://${var.domain_name}"]
    max_age_seconds = 3000
  }
}

resource "aws_s3_bucket_website_configuration" "s3-website-configuration" {
  bucket = aws_s3_bucket.s3-website.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "404.html"
  }
}
