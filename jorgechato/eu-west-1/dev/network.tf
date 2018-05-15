module "vpc" {
	source       = "../../../modules/vpc"
	cidr_block   = "${var.cidr_block}"
	keyname      = "${var.keyname}"
  subnet1_cidr = "${var.subnet1_cidr}"
  subnet2_cidr = "${var.subnet2_cidr}"
  subnet1_az   = "${var.subnet1_az}"
  subnet2_az   = "${var.subnet2_az}"
  env          = "${var.env}"
}
