resource "aws_vpc" "vpc" {
	cidr_block = "${lookup(var.cidr_block, "vpc")}"

	tags {
		Name = "${var.env}"
	}
}

resource "aws_subnet" "subnets" {
	count             = "${lookup(var.count, "subnets")}"
  vpc_id            = "${aws_vpc.vpc.id}"
  availability_zone = "${lookup(var.az, "${format("subnet%d", count.index + 1)}")}"
  cidr_block        = "${lookup(var.cidr_block, "${format("subnet%d", count.index + 1)}")}"

	tags {
		Name = "${var.env}"
	}
}

resource "aws_route_table" "public" {
	vpc_id = "${aws_vpc.vpc.id}"

	route {
		cidr_block = "${lookup(var.cidr_block, "table")}"
		gateway_id = "${aws_internet_gateway.gw.id}"
	}
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.vpc.id}"

	tags {
		Name = "${var.env}"
	}
}

resource "aws_route_table_association" "public" {
	subnet_id = "${aws_subnet.subnets.0.id}"
	route_table_id = "${aws_route_table.public.id}"
}

# resource "aws_" "" {
# }
