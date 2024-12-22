resource "aws_subnet" "dmz_subnet_ue1a" {
  vpc_id                = var.vpc_id
  cidr_block            = var.dmz_subnet_ue1a_cidr
  availability_zone     = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.environment}-dmz-ue1a"
  }
}

resource "aws_subnet" "dmz_subnet_ue2a" {
  vpc_id                = var.vpc_id
  cidr_block            = var.dmz_subnet_ue2a_cidr
  availability_zone     = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.environment}-dmz-ue2a"
  }
}

resource "aws_subnet" "mgn_subnet_ue1a" {
  vpc_id                = var.vpc_id
  cidr_block            = var.mgn_subnet_cidr
  availability_zone     = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.environment}-mgn-ue1a"
  }
}

resource "aws_subnet" "app_subnet_ue1a" {
  vpc_id                = var.vpc_id
  cidr_block            = var.app_subnet_ue1a_cidr
  availability_zone     = "us-east-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.environment}-app-ue1a"
  }
}

resource "aws_subnet" "app_subnet_ue1b" {
  vpc_id                = var.vpc_id
  cidr_block            = var.app_subnet_ue1b_cidr
  availability_zone     = "us-east-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.environment}-app-ue1b"
  }
}

resource "aws_subnet" "data_subnet_ue1a" {
  vpc_id                = var.vpc_id
  cidr_block            = var.data_subnet_ue1a_cidr
  availability_zone     = "us-east-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.environment}-data-ue1a"
  }
}

resource "aws_subnet" "data_subnet_ue1b" {
  vpc_id                = var.vpc_id
  cidr_block            = var.data_subnet_ue1b_cidr
  availability_zone     = "us-east-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.environment}-data-ue1b"
  }
}

