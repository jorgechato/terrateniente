terraform {
  backend "s3" {
    bucket = "sanzalb-contino-adidas-tf"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
}