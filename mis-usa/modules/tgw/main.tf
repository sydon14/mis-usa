# Transit Gateway VPC Attachment
resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attachment" {
  count             = var.create_tgw_attachment ? 1 : 0
  transit_gateway_id = var.transit_gateway_id
  vpc_id             = var.vpc_id
  subnet_ids         = var.tgw_subnet_ids

  tags = {
    Name        = "${var.environment}-tgw-attachment"
    Environment = var.environment
  }
}