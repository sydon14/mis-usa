# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.environment}-igw"
  }
}

# Output the IGW ID for reference
output "igw_id" {
  description = "The ID of the Internet Gateway."
  value       = aws_internet_gateway.igw.id
}
