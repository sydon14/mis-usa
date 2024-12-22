# NAT Gateway
resource "aws_eip" "nat" {
  domain = "vpc" # Replace the deprecated `vpc = true`
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.dmz_subnet_ue1a.id
  tags = {
    Name = "${var.environment}-nat"
  }
}
