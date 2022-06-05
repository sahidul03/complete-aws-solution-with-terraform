resource "aws_security_group" "basition" {
  name = join("-", [var.namespace, "basition"])
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    description = "office 1"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["152.165.127.105/32"]
  }
  ingress {
    description = "office 2"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["124.36.35.118/32"]
  }
  ingress {
    description = "my home"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["60.71.32.131/32"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "vpc_endpoint" {
  name   = join("-", [var.namespace, "vpc-endpoint"])
  vpc_id = aws_vpc.main_vpc.id
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main_vpc.cidr_block]
  }
  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main_vpc.cidr_block]
  }
}
