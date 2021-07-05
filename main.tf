resource "aws_vpc" "regional_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "${var.regional_tag}-vpc"
  }
}

resource "aws_subnet" "public" {
  count      = length(var.public_sn_cidr)
  vpc_id     = aws_vpc.regional_vpc.id
  cidr_block = var.public_sn_cidr[count.index]

  tags = {
    Name = format("public-%s", count.index + 1)
  }
}

resource "aws_subnet" "private" {
  count      = length(var.private_sn_cidr)
  vpc_id     = aws_vpc.regional_vpc.id
  cidr_block = var.private_sn_cidr[count.index]

  tags = {
    Name = format("private-%s", count.index + 1)
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.regional_vpc.id

  tags = {
    Name = "${var.regional_tag}-vpc-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.regional_vpc.id

  tags = {
    Name = "${var.regional_tag}-vpc-public-route-table"
  }
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = var.dest_cidr_block_public_route
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.regional_vpc.id

  tags = {
    Name = "${var.regional_tag}-vpc-private-route-table"
  }
}

resource "aws_route" "private" {
  count                  = var.is_one_nat_gw == true ? 1 : length(var.public_sn_cidr)
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = var.dest_cidr_block_private_route
  nat_gateway_id         = aws_nat_gateway.ngw[count.index].id
}

resource "aws_route_table_association" "public" {
  count          = length(var.public_sn_cidr)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count          = length(var.private_sn_cidr)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

resource "aws_nat_gateway" "ngw" {
  count         = var.is_one_nat_gw == true ? 1 : length(var.public_sn_cidr)
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[count.index].id
  depends_on    = [aws_internet_gateway.igw]

  tags = {
    Name = "${var.regional_tag}-vpc-nat-gw"
  }
}

resource "aws_eip" "nat" {
  vpc = true
  tags = {
    "Name" = "${var.regional_tag}-vpc-nat-gw-eip"
  }
}
