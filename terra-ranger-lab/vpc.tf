data "aws_availability_zones" "ava" {
    state = "available"
    filter {
      name = "zone-type"
      values = ["availability-zone"]
    }
}
//Create VPC
resource "aws_vpc" "dev-vpc-01" {
    tags = {
        Name = var.vpc_name
    }
    cidr_block = "10.0.0.0/18"    
}

//Create Internet Gateway
resource "aws_internet_gateway" "dev-igw" {
    tags = {
        Name = var.igw_name
    }
}

//Attachment from Internet Gateway to vpc
resource "aws_internet_gateway_attachment" "dev-igw-vpc" {
    internet_gateway_id = aws_internet_gateway.dev-igw.id
    vpc_id = aws_vpc.dev-vpc-01.id
}

//Create Public Route Table
resource "aws_route_table" "dev-pub-rtb" {
    vpc_id = aws_vpc.dev-vpc-01.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.dev-igw.id
    }
    tags = {
        Name = var.pub_rtb
    }
}

//Create Private Route Table
resource "aws_route_table" "dev-priv-rtb" {
    vpc_id = aws_vpc.dev-vpc-01.id

    route {
        cidr_block = "10.0.0.0/18"
        gateway_id = "local"
    }
    tags = {
        Name = var.priv_rtb
    }
}

//Associate public subnet with public route table
resource "aws_route_table_association" "pub-subnet-to-pub-rtb" {
    count = length(aws_subnet.dev-public-subnet)
    route_table_id = aws_route_table.dev-pub-rtb.id
    subnet_id = aws_subnet.dev-public-subnet[count.index].id
}

//Associate private subnet with private route table
resource "aws_route_table_association" "private-subnet-to-private-rtb" {
    count = length(aws_subnet.dev-private-subnet)
    route_table_id = aws_route_table.dev-priv-rtb.id
    subnet_id = aws_subnet.dev-private-subnet[count.index].id
}