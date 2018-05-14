env = "adidas"

cidr_block = {
	vpc      = "172.21.1.0/24",
	table    = "0.0.0.0/0",
	subnet1  = "172.21.1.16/28", # public
	subnet2  = "172.21.1.32/28", # private
}
az        = {
	subnet1 = "eu-west-1a", # public
	subnet2 = "eu-west-1b", # private
}
count     = {
	subnets = 2,
}
