# Environment for tagging
variable "environment" {
  description = "The environment for the NAT Gateway"
  type        = string
}

# Subnet ID where the NAT Gateway will be created
variable "subnet_id" {
  description = "The subnet ID for the NAT Gateway"
  type        = string
}

# Default VPC CIDR block
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"  # You can change this CIDR block as needed
}