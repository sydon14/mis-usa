resource "aws_eip" "nat" {
  domain = "vpc" # Replace the deprecated `vpc = true`
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = var.private_subnet_ids[0]  # Replace with desired subnet ID
  tags = {
    Name = "${var.environment}-nat"
  }
}
