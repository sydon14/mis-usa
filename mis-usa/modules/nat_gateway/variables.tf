# Environment for tagging
variable "environment" {
  description = "The environment for the NAT Gateway"
  type        = string
}

# Default VPC CIDR block
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.103.2.0/23"  # Adjust if needed
}

# List of private subnet IDs
variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}
