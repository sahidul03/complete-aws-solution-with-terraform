resource "aws_key_pair" "main" {
  key_name   = join("-", [var.namespace, "basition"])
  public_key = var.public_key
}

resource "aws_instance" "basition" {
  ami                         = "ami-0548e5d1cef315c7f"
  instance_type               = "t4g.small"
  key_name                    = aws_key_pair.main.id
  subnet_id                   = aws_subnet.public["1a"].id
  vpc_security_group_ids      = [aws_security_group.basition.id]
  associate_public_ip_address = true
  count                       = 1
  tags = {
    Name = join("-", [var.namespace, "basition"])
  }
}
