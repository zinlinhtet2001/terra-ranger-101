data "aws_availability_zones" "available" {
  state = "available"
  filter {
    name   = "zone-type"
    values = ["availability-zone"]
  }
}

resource "aws_vpc" "my_vpc" {
  cidr_block = var.my-vpc.cidr
  tags = {
    Name = var.my-vpc.Name
  }
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = var.my-igw
  }
}

resource "aws_route_table" "my_public_rtb" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
  tags = {
    Name = var.my-public-rtb
  }
}

resource "aws_route_table" "my_private_rtb" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = var.my-vpc.cidr
    gateway_id = "local"
  }
  tags = {
    Name = var.my-private-rtb
  }
}

resource "aws_route_table_association" "my_public_subnets_to_public_rtb" {
  for_each       = aws_subnet.my_public_subnets
  route_table_id = aws_route_table.my_public_rtb.id
  subnet_id      = each.value.id
}

resource "aws_route_table_association" "my_private_subnets_to_private_rtb" {
  for_each       = aws_subnet.my_private_subnets
  route_table_id = aws_route_table.my_private_rtb.id
  subnet_id      = each.value.id
}