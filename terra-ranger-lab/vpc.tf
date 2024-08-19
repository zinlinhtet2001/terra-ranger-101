#Procedure of creating VPC in AWS
#Create VPC
#Create subnet
#Create default route table
#Create IGW
#Associate IGW with VPC
#Associate public subent with IGW
#--------------------------------#

resource "aws_vpc" "dev-vpc-01" {
    tags = {
      Name = "dev-vpc-01"
    }
    cidr_block = "10.0.0.0/24"    
}

resource "aws_internet_gateway" "dev-igw" {
    tags = {
        Name = "dev-igw"
    }
}

resource "aws_internet_gateway_attachment" "dev-igw-vpc" {
    internet_gateway_id = aws_internet_gateway.dev-igw.id
    vpc_id = aws_vpc.dev-vpc-01.id
}