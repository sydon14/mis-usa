variable "environment" {
  description = "The environment for the VPC"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "dmz_subnet_ue1a_cidr" {
  description = "CIDR block for the DMZ Subnet (UE1A)"
  type        = string
  default     = "10.103.2.64/27"
}

variable "dmz_subnet_ue2a_cidr" {
  description = "CIDR block for the DMZ Subnet (UE2A)"
  type        = string
  default     = "10.103.2.96/27"
}

variable "mgn_subnet_cidr" {
  description = "CIDR block for the MGN Subnet"
  type        = string
  default     = "10.103.2.32/27"
}

variable "app_subnet_ue1a_cidr" {
  description = "CIDR block for the App Subnet (UE1A)"
  type        = string
  default     = "10.103.2.128/26"
}

variable "app_subnet_ue1b_cidr" {
  description = "CIDR block for the App Subnet (UE1B)"
  type        = string
  default     = "10.103.2.192/26"
}

variable "data_subnet_ue1a_cidr" {
  description = "CIDR block for the Data Subnet (UE1A)"
  type        = string
  default     = "10.103.3.0/26"
}

variable "data_subnet_ue1b_cidr" {
  description = "CIDR block for the Data Subnet (UE1B)"
  type        = string
  default     = "10.103.3.64/26"  # You can adjust the default if needed
}