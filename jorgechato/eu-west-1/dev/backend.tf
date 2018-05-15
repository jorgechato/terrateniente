terraform {
	backend "s3" {
		bucket = "contino-adidas-tf"
		key    = "terraform.tfstate"
		region = "eu-west-1"
	}
}
