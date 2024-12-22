# Shared Infrastructure: S3 Bucket for State Files
resource "aws_s3_bucket" "state_bucket" {
  bucket = "misusa-shared-terraform-state-bucket"

  tags = {
    Name        = "Shared Terraform State Bucket"
    Environment = var.environment
  }
}

# Separate resources for ACL and Server-Side Encryption
resource "aws_s3_bucket_acl" "state_bucket_acl" {
  bucket = aws_s3_bucket.state_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "state_bucket_encryption" {
  bucket = aws_s3_bucket.state_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Manage S3 Bucket Versioning Separately
resource "aws_s3_bucket_versioning" "state_bucket_versioning" {
  bucket = aws_s3_bucket.state_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Shared Infrastructure: DynamoDB Table for Locking
resource "aws_dynamodb_table" "state_lock_table" {
  name     = "terraform-lock-table"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  billing_mode = "PAY_PER_REQUEST"

  tags = {
    Name        = "Terraform Lock Table"
    Environment = var.environment
  }
}

# VPC Creation
resource "aws_vpc" "test" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.environment}-vpc"
  }
}

/* resource "aws_ec2_transit_gateway_vpc_attachment" "test_tgw_attachment" {
  count             = var.create_tgw_attachment ? 1 : 0
  transit_gateway_id = var.transit_gateway_id
  vpc_id             = aws_vpc.test.id
  subnet_ids         = [
    aws_subnet.dmz_subnet_ue1a.id,
    aws_subnet.dmz_subnet_ue2a.id
  ]

  tags = {
    Name        = "${var.environment}-tgw-attachment"
    Environment = var.environment
  }
} */


# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.test.id
  tags = {
    Name = "${var.environment}-igw"
  }
}

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

# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.test.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.environment}-public-rt"
  }
}

# Private Route Table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.test.id

  route {
    cidr_block    = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "${var.environment}-private-rt"
  }
}

# Subnet Definitions
resource "aws_subnet" "dmz_subnet_ue1a" {
  vpc_id                = aws_vpc.test.id
  cidr_block            = var.dmz_subnet_ue1a_cidr
  availability_zone     = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.environment}-dmz-ue1a"
  }
}

resource "aws_subnet" "dmz_subnet_ue2a" {
  vpc_id                = aws_vpc.test.id
  cidr_block            = var.dmz_subnet_ue2a_cidr
  availability_zone     = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.environment}-dmz-ue2a"
  }
}

resource "aws_subnet" "mgn_subnet_ue1a" {
  vpc_id                = aws_vpc.test.id
  cidr_block            = var.mgn_subnet_cidr
  availability_zone     = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.environment}-mgn-ue1a"
  }
}

resource "aws_subnet" "app_subnet_ue1a" {
  vpc_id                = aws_vpc.test.id
  cidr_block            = var.app_subnet_ue1a_cidr
  availability_zone     = "us-east-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.environment}-app-ue1a"
  }
}

resource "aws_subnet" "app_subnet_ue1b" {
  vpc_id                = aws_vpc.test.id
  cidr_block            = var.app_subnet_ue1b_cidr
  availability_zone     = "us-east-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.environment}-app-ue1b"
  }
}

resource "aws_subnet" "data_subnet_ue1a" {
  vpc_id                = aws_vpc.test.id
  cidr_block            = var.data_subnet_ue1a_cidr
  availability_zone     = "us-east-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.environment}-data-ue1a"
  }
}

resource "aws_subnet" "data_subnet_ue1b" {
  vpc_id                = aws_vpc.test.id
  cidr_block            = var.data_subnet_ue1b_cidr
  availability_zone     = "us-east-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.environment}-data-ue1b"
  }
}

# Route Table Associations
resource "aws_route_table_association" "public_dmz_ue1a" {
  subnet_id      = aws_subnet.dmz_subnet_ue1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_dmz_ue2a" {
  subnet_id      = aws_subnet.dmz_subnet_ue2a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_mgn_ue1a" {
  subnet_id      = aws_subnet.mgn_subnet_ue1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_app_ue1a" {
  subnet_id      = aws_subnet.app_subnet_ue1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_app_ue1b" {
  subnet_id      = aws_subnet.app_subnet_ue1b.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_data_ue1a" {
  subnet_id      = aws_subnet.data_subnet_ue1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_data_ue1b" {
  subnet_id      = aws_subnet.data_subnet_ue1b.id
  route_table_id = aws_route_table.private.id
}
