terraform {
  required_version = "~>1.5.0"
  backend "s3" {
    bucket         = "sam2n-front-app"
    key            = "terraform-front.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "sam2n-terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "eu-central-1"
}