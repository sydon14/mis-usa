# Output the AWS region
output "aws_region" {
  description = "The AWS region used for deployment"
  value       = var.aws_region
}

# Output the S3 bucket name for Terraform state
output "s3_bucket_name" {
  description = "The name of the S3 bucket used for Terraform state"
  value       = aws_s3_bucket.state_bucket.bucket
}

# Output the DynamoDB table name for Terraform state locking
output "dynamodb_table_name" {
  description = "The name of the DynamoDB table used for Terraform state locking"
  value       = aws_dynamodb_table.state_lock_table.name
}

# Output the ID of the created VPC
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.test.id
}

# Output the Internet Gateway ID
output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
}

# Output the NAT Gateway ID
output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.nat.id
}

# Output the public subnets
output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = [
    aws_subnet.dmz_subnet_ue1a.id,
    aws_subnet.dmz_subnet_ue2a.id
  ]
}

# Output the private subnets
output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = [
    aws_subnet.app_subnet_ue1a.id,
    aws_subnet.app_subnet_ue1b.id,
    aws_subnet.data_subnet_ue1a.id,
    aws_subnet.data_subnet_ue1b.id
  ]
}

# Output the Transit Gateway ID 
# output "transit_gateway_id" {
#   description = "The ID of the Transit Gateway used for the attachment"
#   value       = var.transit_gateway_id
# }

# Output the Transit Gateway VPC Attachment ID 
# output "transit_gateway_vpc_attachment_id" {
#   description = "The ID of the Transit Gateway VPC attachment"
#   value       = aws_ec2_transit_gateway_vpc_attachment.test_tgw_attachment.id
# }