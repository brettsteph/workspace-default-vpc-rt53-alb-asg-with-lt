resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

# Declare the data source
data "aws_availability_zones" "available" {
  state = "available"
}


data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [aws_default_vpc.default.id]
  }
}

# data "aws_subnet" "subnet" {
#   for_each = toset(data.aws_subnets.subnets.ids)
#   id       = each.value
# }

# output "subnet_cidr_blocks" {
#   value = [for s in data.aws_subnet.subnet : s.cidr_block]
# }
