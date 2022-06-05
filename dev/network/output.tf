output "network" {
  value = {
    vpc = {
      account_vpc = {
        id = aws_vpc.main_vpc.id
      }
    }
    subnet = {
      private_1a = {
        id = aws_subnet.private["1a"].id
      }
      private_1c = {
        id = aws_subnet.private["1c"].id
      }
      public_1a = {
        id = aws_subnet.public["1a"].id
      }
      public_1c = {
        id = aws_subnet.public["1c"].id
      }
    }
    security_group = {
      basition = {
        id = aws_security_group.basition.id
      }
      rds = {
        id = aws_security_group.rds.id
      }
    }
    eip = {
      nat_1a = {
        id = aws_eip.nat["1a"].id
      }
      nat_1c = {
        id = aws_eip.nat["1c"].id
      }
    }
  }
}
