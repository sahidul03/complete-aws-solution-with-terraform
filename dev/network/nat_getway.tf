resource "aws_nat_gateway" "nat_gateway" {
  for_each      = toset(var.azs)
  allocation_id = aws_eip.nat[each.key].id
  subnet_id     = aws_subnet.public[each.key].id
  tags = {
    "Name" = join("-", [var.namespace, each.key])
  }
}
