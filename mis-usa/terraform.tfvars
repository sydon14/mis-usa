aws_region             = "us-east-1"
aws_profile            = "Eviden"
environment           = "dev"

# VPC and Subnet CIDR Blocks
vpc_cidr              = "10.103.2.0/23"
dmz_subnet_ue1a_cidr  = "10.103.2.64/27"
dmz_subnet_ue2a_cidr  = "10.103.2.96/27"
mgn_subnet_cidr       = "10.103.2.32/27"
app_subnet_ue1a_cidr  = "10.103.2.128/26"
app_subnet_ue1b_cidr  = "10.103.2.192/26"
data_subnet_ue1a_cidr = "10.103.3.0/26"
data_subnet_ue1b_cidr = "10.103.3.64/26"

private_subnet_ids = ["subnet-0018a216ec673892e"]
environment        = "dev"

# Transit Gateway ID (if needed in future)
# transit_gateway_id   = "tgw-xxxxxxxx"  # Replace with actual TGW ID