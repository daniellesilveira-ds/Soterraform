provider "aws" {
  region = "sa-east-1"
}

resource "aws_subnet" "soterraform_subnetPub_1a" {
  vpc_id            = "vpc-0a08641ef0b17c6f9"
  cidr_block        = "10.40.64.0/24"
  availability_zone = "sa-east-1a"

  tags = {
    Name = "soterraform_subnetPub_1a"
  }
}
resource "aws_subnet" "soterraform_subnetPub_1b" {
  vpc_id            = "vpc-0a08641ef0b17c6f9"
  cidr_block        = "10.40.65.0/24"
  availability_zone = "sa-east-1b"

  tags = {
    Name = "soterraform_subnetPub_1b"
  }
}
resource "aws_subnet" "soterraform_subnetPub_1c" {
  vpc_id            = "vpc-0a08641ef0b17c6f9"
  cidr_block        = "10.40.66.0/24"
  availability_zone = "sa-east-1c"

  tags = {
    Name = "soterraform_subnetPub_1c"
  }
}
resource "aws_subnet" "soterraform_subnetPriv_1a" {
  vpc_id            = "vpc-0a08641ef0b17c6f9"
  cidr_block        = "10.40.67.0/24"
  availability_zone = "sa-east-1a"

  tags = {
    Name = "soterraform_subnetPriv_1a"
  }
}
resource "aws_subnet" "soterraform_subnetPriv_1b" {
  vpc_id            = "vpc-0a08641ef0b17c6f9"
  cidr_block        = "10.40.68.0/24"
  availability_zone = "sa-east-1b"

  tags = {
    Name = "soterraform_subnetPriv_1b"
  }
}
resource "aws_subnet" "soterraform_subnetPriv_1c" {
  vpc_id            = "vpc-0a08641ef0b17c6f9"
  cidr_block        = "10.40.69.0/24"
  availability_zone = "sa-east-1c"

  tags = {
    Name = "soterraform_subnetPriv_1c"
  }
}

resource "aws_route_table" "soterraform_rtPub" {
  vpc_id = "vpc-0a08641ef0b17c6f9"
  route = [
      {
        carrier_gateway_id         = ""
        cidr_block                 = "0.0.0.0/0"
        destination_prefix_list_id = ""
        egress_only_gateway_id     = ""
        gateway_id                 = "igw-0e384ad16340fb061"
        instance_id                = ""
        ipv6_cidr_block            = ""
        local_gateway_id           = ""
        nat_gateway_id             = ""
        network_interface_id       = ""
        transit_gateway_id         = ""
        vpc_endpoint_id            = ""
        vpc_peering_connection_id  = ""
      }
  ]
  tags = {
    Name = "soterraform_rtPub"
  }
}

resource "aws_route_table" "soterraform_rtPriv1a" {
  vpc_id = "vpc-0a08641ef0b17c6f9"
  route = [
      {
        carrier_gateway_id         = ""
        cidr_block                 = "0.0.0.0/0"
        destination_prefix_list_id = ""
        egress_only_gateway_id     = ""
        gateway_id                 = ""
        instance_id                = ""
        ipv6_cidr_block            = ""
        local_gateway_id           = ""
        nat_gateway_id             = aws_nat_gateway.soterraform_NATGW1a.id
        network_interface_id       = ""
        transit_gateway_id         = ""
        vpc_endpoint_id            = ""
        vpc_peering_connection_id  = ""
      }
  ]
  tags = {
    Name = "soterraform_rtPriv1a"
  }
}
resource "aws_route_table" "soterraform_rtPriv1b" {
  vpc_id = "vpc-0a08641ef0b17c6f9"
  route = [
      {
        carrier_gateway_id         = ""
        cidr_block                 = "0.0.0.0/0"
        destination_prefix_list_id = ""
        egress_only_gateway_id     = ""
        gateway_id                 = ""
        instance_id                = ""
        ipv6_cidr_block            = ""
        local_gateway_id           = ""
        nat_gateway_id             = aws_nat_gateway.soterraform_NATGW1b.id
        network_interface_id       = ""
        transit_gateway_id         = ""
        vpc_endpoint_id            = ""
        vpc_peering_connection_id  = ""
      }
  ]
  tags = {
    Name = "soterraform_rtPriv1b"
  }
}

resource "aws_route_table" "soterraform_rtPriv1c" {
  vpc_id = "vpc-0a08641ef0b17c6f9"
  route = [
      {
        carrier_gateway_id         = ""
        cidr_block                 = "0.0.0.0/0"
        destination_prefix_list_id = ""
        egress_only_gateway_id     = ""
        gateway_id                 = ""
        instance_id                = ""
        ipv6_cidr_block            = ""
        local_gateway_id           = ""
        nat_gateway_id             = aws_nat_gateway.soterraform_NATGW1c.id
        network_interface_id       = ""
        transit_gateway_id         = ""
        vpc_endpoint_id            = ""
        vpc_peering_connection_id  = ""
      }
  ]
  tags = {
    Name = "soterraform_rtPriv1c"
  }
}

resource "aws_route_table_association" "soterraform_rtPriv_Assoc1a" {
  subnet_id      = aws_subnet.soterraform_subnetPriv_1a.id
  route_table_id = aws_route_table.soterraform_rtPriv1a.id
}
resource "aws_route_table_association" "soterraform_rtPriv_Assoc1b" {
  subnet_id      = aws_subnet.soterraform_subnetPriv_1b.id
  route_table_id = aws_route_table.soterraform_rtPriv1b.id
}
resource "aws_route_table_association" "soterraform_rtPriv_Assoc1c" {
  subnet_id      = aws_subnet.soterraform_subnetPriv_1c.id
  route_table_id = aws_route_table.soterraform_rtPriv1c.id
}

resource "aws_route_table_association" "soterraform_rtPub_Assoc1a" {
  subnet_id      = aws_subnet.soterraform_subnetPub_1a.id
  route_table_id = aws_route_table.soterraform_rtPub.id
}
resource "aws_route_table_association" "soterraform_rtPub_Assoc1b" {
  subnet_id      = aws_subnet.soterraform_subnetPub_1b.id
  route_table_id = aws_route_table.soterraform_rtPub.id
}
resource "aws_route_table_association" "soterraform_rtPub_Assoc1c" {
  subnet_id      = aws_subnet.soterraform_subnetPub_1c.id
  route_table_id = aws_route_table.soterraform_rtPub.id
}

resource "aws_eip" "nat_gateway1a" {
  vpc = true
}
resource "aws_eip" "nat_gateway1b" {
  vpc = true
}
resource "aws_eip" "nat_gateway1c" {
  vpc = true
}

resource "aws_nat_gateway" "soterraform_NATGW1a" {
  allocation_id = aws_eip.nat_gateway1a.id
  subnet_id     = aws_subnet.soterraform_subnetPub_1a.id
  tags = {
    Name = "soterraform_NATGW1a"
  }
}
resource "aws_nat_gateway" "soterraform_NATGW1b" {
  allocation_id = aws_eip.nat_gateway1b.id
  subnet_id     = aws_subnet.soterraform_subnetPub_1b.id
  tags = {
    Name = "soterraform_NATGW1b"
  }
}
resource "aws_nat_gateway" "soterraform_NATGW1c" {
  allocation_id = aws_eip.nat_gateway1c.id
  subnet_id     = aws_subnet.soterraform_subnetPub_1c.id
  tags = {
    Name = "soterraform_NATGW1c"
  }
}



output "subnets" {
  value = [
    "SubnetPub1a: ${aws_subnet.soterraform_subnetPub_1a.id}",
    "SubnetPub1b: ${aws_subnet.soterraform_subnetPub_1b.id}",
    "SubnetPub1c: ${aws_subnet.soterraform_subnetPub_1c.id}",
    "SubnetPriv1a: ${aws_subnet.soterraform_subnetPriv_1a.id}",
    "SubnetPriv1b: ${aws_subnet.soterraform_subnetPriv_1b.id}",
    "SubnetPriv1c: ${aws_subnet.soterraform_subnetPriv_1c.id}",
  ]
}