resource "aws_vpc" "cas_vpc" {
  cidr_block = var.vpc.cidr_block
}
