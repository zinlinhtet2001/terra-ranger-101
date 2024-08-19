variable "vpc_name" {
    default = "dev-vpc-01"
}

//Create Internet Gateway
variable "igw_name" {
    default = "dev-igw" 
}

//Create Public Subnet
variable "zone_for_pub_subnet" {
    type = list(string)
    default = [ "ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"  ]
}
variable "cidr_for_pub_subnet" {
    type = list(string)
    default = [ "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24" ]
}
variable "name_for_pub_subnet" {
    type = list(string)
    default = [ "dev-pub-1", "dev-pub-2", "dev-pub-3" ]
}

//Create Private Subnet
variable "zone_for_priv_subnet" {
    type = list(string)
    default = [ "ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c" ]
}
variable "cidr_for_priv_subnet" {
    type = list(string)
    default = [ "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24" ]
}
variable "name_for_priv_subnet" {
    type = list(string)
    default = [ "dev-priv-1", "dev-priv-2", "dev-priv-3" ]
}

//Create Public Route Table
variable "pub_rtb" {
    default = "dev-pub-rtb"
}

//Create Private Route Table
variable "priv_rtb" {
    default = "dev-priv-rtb"
}