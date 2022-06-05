resource "aws_db_subnet_group" "private" {
  subnet_ids = [
    var.network.subnet.private_1a.id,
    var.network.subnet.private_1c.id
  ]
}
