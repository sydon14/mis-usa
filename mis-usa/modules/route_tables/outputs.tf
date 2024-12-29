# Route Table Module: outputs.tf

output "public_route_table_associations" {
  description = "The subnet associations for the public route table"
  value       = aws_route_table_association.public[*].subnet_id
}

output "private_route_table_associations" {
  description = "The subnet associations for the private route table"
  value       = aws_route_table_association.private[*].subnet_id
}