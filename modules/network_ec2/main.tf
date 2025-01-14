# Create a VPC
resource "aws_vpc" "example_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "${var.name}-vpc"
  }
}

# Create a subnet
resource "aws_subnet" "example_subnet" {
  vpc_id            = aws_vpc.example_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.name}-subnet"
  }
}

resource "aws_security_group" "example_sg" {
  name   = "${var.name}-sg"
  vpc_id = aws_vpc.example_vpc.id

  tags = {
    Name = "${var.name}SecurityGroup"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_all_inbound" {
  for_each          = {for each in var.incoming_ports : each.from => each}
  security_group_id = aws_security_group.example_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = each.value.from != 0 ? each.value.from : null
  to_port           = each.value.to != 0 ? each.value.to : null
  ip_protocol       = each.value.protocol
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  for_each          = {for each in var.outgoing_ports : each.from => each}
  security_group_id = aws_security_group.example_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = each.value.from != 0 ? each.value.from : null
  to_port           = each.value.to != 0 ? each.value.to : null
  ip_protocol       = each.value.protocol
}

resource "aws_vpc_security_group_ingress_rule" "allow_all_inbound_v6" {
  for_each          = {for each in var.incoming_ports : each.from => each}
  security_group_id = aws_security_group.example_sg.id
  cidr_ipv6         = "::/0"
  from_port         = each.value.from != 0 ? each.value.from : null
  to_port           = each.value.to != 0 ? each.value.to : null
  ip_protocol       = each.value.protocol
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound_v6" {
  for_each          = {for each in var.outgoing_ports : each.from => each}
  security_group_id = aws_security_group.example_sg.id
  cidr_ipv6         = "::/0"
  from_port         = each.value.from != 0 ? each.value.from : null
  to_port           = each.value.to != 0 ? each.value.to : null
  ip_protocol       = each.value.protocol
}

resource "aws_internet_gateway" "test_env_gw" {
  vpc_id = aws_vpc.example_vpc.id
}

resource "aws_route_table" "PublicRouteTable" {
  vpc_id = aws_vpc.example_vpc.id
  tags = {
    Name = "${var.name}RouteTable"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test_env_gw.id
  }
  depends_on = [aws_vpc.example_vpc, aws_internet_gateway.test_env_gw]
}

resource "aws_route_table_association" "PublicRouteTableAssociate" {
  subnet_id = aws_subnet.example_subnet.id
  route_table_id = aws_route_table.PublicRouteTable.id
  depends_on = [aws_subnet.example_subnet, aws_route_table.PublicRouteTable]
}