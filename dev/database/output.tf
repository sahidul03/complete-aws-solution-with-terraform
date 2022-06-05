output "database" {
  value = {
    db_subnet_group = {
      private = {
        name = aws_db_subnet_group.private.name
      }
    }
    rds_cluster_parameter_group = {
      cas = {
        name = aws_rds_cluster_parameter_group.cas.name
      }
    }
    db_parameter_group = {
      cas = {
        name = aws_db_parameter_group.cas.name
      }
    }
  }
}
