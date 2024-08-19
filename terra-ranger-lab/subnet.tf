data "aws_availability_zones" "available" {
    state = "available"
}

//Create Public Subnet
resource "aws_subnet" "dev-public-subnet" {
    count = length(data.aws_availability_zones.available.names)
    vpc_id = aws_vpc.dev-vpc-01.id
    availability_zone = var.zone_for_pub_subnet[count.index]
    cidr_block = var.cidr_for_pub_subnet[count.index]
        tags = {
            Name = var.name_for_pub_subnet[count.index]
    }
}

//Create Private Subnet
resource "aws_subnet" "dev-private-subnet" {
    count = length(data.aws_availability_zones.available.names)
    vpc_id = aws_vpc.dev-vpc-01.id
    availability_zone = var.zone_for_priv_subnet[count.index]
    cidr_block = var.cidr_for_priv_subnet[count.index]
        tags = {
            Name = var.name_for_priv_subnet[count.index]
    }
}