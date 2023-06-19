# Retrieve availability zones
data "aws_availability_zones" "available" {
  state = "available"
}

# Determine Zone A and Zone B
locals {
  zone_a = data.aws_availability_zones.available.names[0]
  zone_b = data.aws_availability_zones.available.names[1]
}