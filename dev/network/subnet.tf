resource "aws_subnet" "private" {
  for_each = var.subnet["private"]
  vpc_id     = aws_vpc.cas_vpc.id
  cidr_block = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = {
    Name = join("-", [var.namespace, "private", each.key])
  }
}

resource "aws_subnet" "public" {
  for_each = var.subnet["public"]
  vpc_id     = aws_vpc.cas_vpc.id
  cidr_block = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = {
    Name = join("-", [var.namespace, "public", each.key])
  }
}
