terraform {
  required_version = ">=1.3.7"
  backend "s3" {
    bucket         = "sam2n-tf-state-bucket"
    key            = "terraform-front.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "sam2n-terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "eu-central-1"
}