resource "aws_rds_cluster" "cas" {
  cluster_identifier                  = join("-", [var.namespace, "rds-cluster"])
  engine                              = var.rds_cluster.engine
  engine_version                      = var.rds_cluster.engine_version
  database_name                       = var.rds_cluster.database_name
  master_username                     = var.secret.master_username
  master_password                     = var.secret.master_password
  db_subnet_group_name                = aws_db_subnet_group.private.name
  vpc_security_group_ids              = [var.network.security_group.rds.id]
  db_cluster_parameter_group_name     = aws_rds_cluster_parameter_group.cas.name
  iam_database_authentication_enabled = true
  skip_final_snapshot                 = var.rds_cluster.skip_final_snapshot
  copy_tags_to_snapshot               = true
  backup_retention_period             = 35
  enabled_cloudwatch_logs_exports = [
    "audit",
    "error",
    "general",
    "slowquery"
  ]
}

resource "aws_rds_cluster_parameter_group" "cas" {
  name   = join("-", [var.namespace, "cluster-pg"])
  family = var.rds_cluster.family

  parameter {
    name  = "character_set_server"
    value = "utf8mb4"
  }
  parameter {
    name  = "collation_server"
    value = "utf8mb4_general_ci"
  }
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  count                   = var.rds_cluster_instance.count
  identifier              = join("-", [aws_rds_cluster.cas.cluster_identifier, count.index])
  cluster_identifier      = aws_rds_cluster.cas.cluster_identifier
  instance_class          = var.rds_cluster_instance.instance_class
  engine                  = aws_rds_cluster.cas.engine
  engine_version          = aws_rds_cluster.cas.engine_version
  db_parameter_group_name = aws_db_parameter_group.cas.name
  promotion_tier          = 1
}

resource "aws_db_parameter_group" "cas" {
  name   = join("-", [var.namespace, "db-pg"])
  family = var.rds_cluster.family
  parameter {
    name  = "slow_query_log"
    value = "1"
  }
  parameter {
    name  = "long_query_time"
    value = "1"
  }
}
