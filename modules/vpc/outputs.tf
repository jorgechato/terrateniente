# Provides subnet id for each subnet created
output "private_subnet_id" {
	value = "${aws_subnet.private.id}"
}

output "public_subnet_id" {
	value = "${aws_subnet.public.id}"
}

# Provides the ID of the vpc
output "vpc_ids" {
	value = "${aws_vpc.vpc.id}"
}
