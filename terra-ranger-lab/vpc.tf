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
      name = "dev-vpc-01"
    }
    cidr_block = "10.0.0.0/24"    
}