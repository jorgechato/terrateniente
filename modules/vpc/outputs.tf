# Provides subnet id for each subnet created
output "subnet_ids" {
	value = "${aws_subnet.subnet.*.id}"
}

# Provides the ID of the vpc
output "vpc_ids" {
	value = "${aws_vpc.vpc.id}"
}
