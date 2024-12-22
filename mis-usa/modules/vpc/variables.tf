# Define the CIDR block for the VPC with a default value
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.103.2.0/23"  # Default CIDR block for the VPC
}

# Define the environment variable
variable "environment" {
  description = "The environment for the VPC"
  type        = string
}