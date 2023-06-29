module "s3-website" {
  source      = "./modules/s3-website"
  bucket_name = "sam2n-tf-state-bucket"
  domain_name = "sam2n-app.com"
}