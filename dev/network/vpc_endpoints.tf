resource "aws_vpc_endpoint" "ecr_dkr" {
  service_name = "com.amazonaws.${data.aws_region.current.name}.ecr.dkr"
  vpc_endpoint_type = "Interface"
  vpc_id = aws_vpc.main_vpc.id
  subnet_ids = [for private in aws_subnet.private : private.id]
  security_group_ids = [
    aws_security_group.vpc_endpoint.id
  ]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ecr_api" {
  service_name      = "com.amazonaws.${data.aws_region.current.name}.ecr.api"
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.main_vpc.id
  subnet_ids        = [for private in aws_subnet.private : private.id]
  security_group_ids = [
    aws_security_group.vpc_endpoint.id
  ]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "s3" {
  service_name      = "com.amazonaws.${data.aws_region.current.name}.s3"
  vpc_endpoint_type = "Gateway"
  vpc_id            = aws_vpc.main_vpc.id
  route_table_ids        = [for private in aws_route_table.private : private.id]
}

resource "aws_vpc_endpoint_route_table_association" "s3" {
  for_each        = toset([for route_table in aws_route_table.private : route_table.id])
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
  route_table_id  = each.key
}

resource "aws_vpc_endpoint" "logs" {
  service_name      = "com.amazonaws.${data.aws_region.current.name}.logs"
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.main_vpc.id
  subnet_ids        = [for private in aws_subnet.private : private.id]
  security_group_ids = [
    aws_security_group.vpc_endpoint.id
  ]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ssm" {
  service_name      = "com.amazonaws.${data.aws_region.current.name}.ssm"
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.main_vpc.id
  subnet_ids        = [for private in aws_subnet.private : private.id]
  security_group_ids = [
    aws_security_group.vpc_endpoint.id
  ]
  private_dns_enabled = true
}
