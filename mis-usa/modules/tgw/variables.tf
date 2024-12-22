variable "create_tgw_attachment" {
  description = "Flag to enable or disable the creation of the TGW VPC attachment"
  type        = bool
  default     = true
}

variable "transit_gateway_id" {
  description = "ID of the Transit Gateway"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC to attach to the Transit Gateway"
  type        = string
}

variable "tgw_subnet_ids" {
  description = "List of subnet IDs to use for the TGW attachment"
  type        = list(string)
}

variable "environment" {
  description = "Environment name (e.g., dev, test, prod)"
  type        = string
}