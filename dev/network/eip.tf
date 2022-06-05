resource "aws_eip" "nat" {
  for_each = toset(var.azs)
  vpc      = true
  tags = {
    "Name" = join("-", [var.namespace, each.key])
  }
}
