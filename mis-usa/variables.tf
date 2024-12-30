variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS profile for authentication"
  type        = string
  default     = "Eviden"  # Replace with your profile 
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.103.2.0/23"
}

variable "dmz_subnet_ue1a_cidr" {
  description = "CIDR block for DMZ subnet ue1a"
  type        = string
  default     = "10.103.2.64/27"
}

variable "dmz_subnet_ue2a_cidr" {
  description = "CIDR block for DMZ subnet ue2a"
  type        = string
  default     = "10.103.2.96/27"
}

variable "mgn_subnet_cidr" {
  description = "CIDR block for MGN subnet ue1a"
  type        = string
  default     = "10.103.2.32/27"
}

variable "app_subnet_ue1a_cidr" {
  description = "CIDR block for App subnet ue1a"
  type        = string
  default     = "10.103.2.128/26"
}

variable "app_subnet_ue1b_cidr" {
  description = "CIDR block for App subnet ue1b"
  type        = string
  default     = "10.103.2.192/26"
}

variable "data_subnet_ue1a_cidr" {
  description = "CIDR block for Data subnet ue1a"
  type        = string
  default     = "10.103.3.0/26"
}

variable "data_subnet_ue1b_cidr" {
  description = "CIDR block for Data subnet ue1b"
  type        = string
  default     = "10.103.3.64/26"
}

/* 
variable "transit_gateway_id" {
  description = "ID of the Transit Gateway"
  type        = string
}
*/