variable "my-region" {
  default = "ap-southeast-1"
}

variable "my-profile" {
  default = "fsl"
}
variable "my-vpc" {
  type = object({
    Name = string
    cidr = string
  })
  default = {
    Name = "uat-vpc-01"
    cidr = "10.0.0.0/16"
  }
}

variable "my-igw" {
  default = "uat-igw"
}

variable "my-public-subnets" {
  type = map(object({
    zone   = string
    subnet = string
    Name   = string
  }))
  default = {
    "public_subnet_1" = {
      zone   = "ap-southeast-1a"
      subnet = "10.0.1.0/24"
      Name   = "uat-pub-1"
    },
    "public_subnet_2" = {
      zone   = "ap-southeast-1b"
      subnet = "10.0.2.0/24"
      Name   = "uat-pub-2"
    },
    "public_subnet_3" = {
      zone   = "ap-southeast-1c"
      subnet = "10.0.3.0/24"
      Name   = "uat-pub-3"
    }
  }
}

variable "my-private-subnets" {
  type = map(object({
    zone   = string
    subnet = string
    Name   = string
  }))
  default = {
    "private_subnet_1" = {
      zone   = "ap-southeast-1a"
      subnet = "10.0.4.0/24"
      Name   = "uat-priv-1"
    },
    "private_subnet_2" = {
      zone   = "ap-southeast-1b"
      subnet = "10.0.5.0/24"
      Name   = "uat-priv-2"
    },
    "private_subnet-3" = {
      zone   = "ap-southeast-1c"
      subnet = "10.0.6.0/24"
      Name   = "uat-priv-3"
    }
  }
}

variable "my-public-rtb" {
  default = "uat-pub-rtb"
}

variable "my-private-rtb" {
  default = "uat-priv-rtb"
}