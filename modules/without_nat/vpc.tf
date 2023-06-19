# Create the main VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "main-vpc"
  }
}

# Create Public Subnet A
resource "aws_subnet" "public_subnet_a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_a_cidr_block
  availability_zone = local.zone_a

  tags = {
    Name = "public-subnet-a"
    Tier = "public"
  }
}

# Create Public Subnet B
resource "aws_subnet" "public_subnet_b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_b_cidr_block
  availability_zone = local.zone_b

  tags = {
    Name = "public-subnet-b"
    Tier = "public"
  }
}

# Create Private Subnet A
resource "aws_subnet" "private_subnet_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_a_cidr_block
  availability_zone = local.zone_a

  tags = {
    Name = "private-subnet-a"
    Tier = "private"
  }
}

# Create Private Subnet B
resource "aws_subnet" "private_subnet_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_b_cidr_block
  availability_zone = local.zone_b

  tags = {
    Name = "private-subnet-b"
    Tier = "private"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "internet-gateway"
  }
}

# Create Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "public-route-table"
  }
}

# Associate Public Subnet A with the Public Route Table
resource "aws_route_table_association" "public_subnet_a" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.public.id
}

# Associate Public Subnet B with the Public Route Table
resource "aws_route_table_association" "public_subnet_b" {
  subnet_id      = aws_subnet.public_subnet_b.id
  route_table_id = aws_route_table.public.id
}