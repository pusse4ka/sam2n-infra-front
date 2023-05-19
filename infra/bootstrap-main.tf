# Call the seed_module to build our ADO seed info
module "bootstrap" {
  source                       = "./modules/bootstrap"
  s3_bucket_tf_state_name      = "sam2n-tf-state-bucket"
  dynamo_db_tf_lock_table_name = "sam2n-terraform-locks"
}