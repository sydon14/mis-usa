output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.nat.id
}

output "nat_gateway_public_ip" {
  description = "The public IP address of the NAT Gateway"
  value       = aws_eip.nat.public_ip
}

output "nat_gateway_allocation_id" {
  description = "The allocation ID of the Elastic IP for the NAT Gateway"
  value       = aws_eip.nat.id
}