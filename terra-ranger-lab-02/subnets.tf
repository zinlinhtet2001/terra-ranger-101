resource "aws_subnet" "my_public_subnets" {
  for_each                = var.my-public-subnets
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = each.value.subnet
  map_public_ip_on_launch = true
  availability_zone       = each.value.zone
  tags = {
    Name = each.value.Name
  }
}

resource "aws_subnet" "my_private_subnets" {
  for_each          = var.my-private-subnets
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = each.value.subnet
  availability_zone = each.value.zone
  tags = {
    Name = each.value.Name
  }
}