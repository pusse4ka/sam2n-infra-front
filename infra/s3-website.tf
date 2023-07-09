module "s3-website" {
  source      = "./modules/s3-website"
  bucket_name = "sam2n-front-app"
  domain_name = "www-notjustsport.net"
}