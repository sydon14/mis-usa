output "tgw_attachment_id" {
  description = "The ID of the Transit Gateway VPC attachment"
  value       = var.create_tgw_attachment ? aws_ec2_transit_gateway_vpc_attachment.tgw_attachment[0].id : null
}

output "tgw_attachment_status" {
  description = "The status of the Transit Gateway VPC attachment"
  value       = var.create_tgw_attachment ? aws_ec2_transit_gateway_vpc_attachment.tgw_attachment[0].state : null
}