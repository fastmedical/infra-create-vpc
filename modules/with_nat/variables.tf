variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_a_cidr_block" {
  description = "CIDR block for Public Subnet A"
  type        = string
}

variable "public_subnet_b_cidr_block" {
  description = "CIDR block for Public Subnet B"
  type        = string
}

variable "private_subnet_a_cidr_block" {
  description = "CIDR block for Private Subnet A"
  type        = string
}

variable "private_subnet_b_cidr_block" {
  description = "CIDR block for Private Subnet B"
  type        = string
}