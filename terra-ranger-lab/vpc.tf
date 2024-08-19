#Procedure of creating VPC in AWS
#Create VPC
#Create IGW
#Associate IGW with VPC
#Create subnet
#Create default route table
#Associate public subent with IGW
#--------------------------------#

#Create VPC
resource "aws_vpc" "dev-vpc-01" {
    tags = {
        Name = "dev-vpc-01"
    }
    cidr_block = "10.0.0.0/18"    
}
#Create Internet Gateway
resource "aws_internet_gateway" "dev-igw" {
    tags = {
        Name = "dev-igw"
    }
}
#Attachment from Internet Gateway to vpc
resource "aws_internet_gateway_attachment" "dev-igw-vpc" {
    internet_gateway_id = aws_internet_gateway.dev-igw.id
    vpc_id = aws_vpc.dev-vpc-01.id
}
#Create public subnet 1
resource "aws_subnet" "dev-pub-subnet-1" {
    vpc_id = aws_vpc.dev-vpc-01.id
    cidr_block = "10.0.1.0/24"
    tags = {
        Name = "dev-pub-subnet-1"
    }
}
#Create public subnet 2
resource "aws_subnet" "dev-pub-subent-2" {
    vpc_id = aws_vpc.dev-vpc-01.id
    cidr_block = "10.0.2.0/24"
    tags = {
        Name = "dev-pub-subnet-2"
    }
}