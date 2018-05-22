resource "aws_instance" "jumphost" {
  ami           = "ami-9cbe9be5"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.public.id}"
  key_name = "${var.keyname}"
  vpc_security_group_ids = ["${aws_security_group.public.id}"]

  tags {
    Name = "Jump Host"
  }
}

resource "aws_eip" "jumphost" {
  instance = "${aws_instance.jumphost.id}"
  vpc = true
}

resource "aws_security_group" "public" {
  description = "Public"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags {
    Name = "Public"
  }
}


resource "aws_instance" "private" {
  ami           = "ami-9cbe9be5"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.private.id}"
  key_name = "${var.keyname}"
  vpc_security_group_ids = ["${aws_security_group.private.id}"]

  tags {
    Name = "Private"
  }
}

resource "aws_security_group" "private" {
  description = "Private"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = ["${aws_security_group.public.id}"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags {
    Name = "Private"
  }
}