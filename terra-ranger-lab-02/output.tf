output "my_zones" {
  value = data.aws_availability_zones.available.names
}

output "my_vpc_id" {
  value = "My VPC ID is ${aws_vpc.my_vpc.id}"
}

output "my_vpc_name" {
  value = aws_vpc.my_vpc.tags
}