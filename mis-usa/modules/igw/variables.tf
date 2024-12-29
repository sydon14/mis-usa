# Define the environment variable
variable "environment" {
  description = "The environment for the VPC"
  type        = string
}


variable "vpc_id" {
  description = "The ID of the VPC where the Internet Gateway will be attached"
  type        = string
  default     = ""  
}