# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.test.id
  tags = {
    Name = "${var.environment}-igw"
  }
}
