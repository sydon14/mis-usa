# Environment for tagging
variable "environment" {
  description = "The environment for the VPC"
  type        = string
}

# List of subnet IDs for public subnets
variable "public_subnet_ids" {
  description = "List of subnet IDs for the public subnets"
  type        = list(string)
}

# List of subnet IDs for private subnets
variable "private_subnet_ids" {
  description = "List of subnet IDs for the private subnets"
  type        = list(string)
}

# VPC ID
variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

# NAT Gateway ID for private subnets
variable "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  type        = string
}

# Internet Gateway ID for public subnets
variable "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  type        = string
}