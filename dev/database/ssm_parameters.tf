resource "aws_ssm_parameter" "MYSQL_HOST" {
  name      = join("/", ["", var.namespace, "MYSQL_HOST"])
  type      = "String"
  value     = aws_rds_cluster.cas.endpoint
  overwrite = true
}

resource "aws_ssm_parameter" "MYSQL_PORT" {
  name      = join("/", ["", var.namespace, "MYSQL_PORT"])
  type      = "String"
  value     = aws_rds_cluster.cas.port
  overwrite = true
}

resource "aws_ssm_parameter" "MYSQL_DATABASE_NAME" {
  name      = join("/", ["", var.namespace, "MYSQL_DATABASE_NAME"])
  type      = "String"
  value     = aws_rds_cluster.cas.database_name
  overwrite = true
}

resource "aws_ssm_parameter" "MYSQL_USER" {
  name      = join("/", ["", var.namespace, "MYSQL_USER"])
  type      = "String"
  value     = aws_rds_cluster.cas.master_username
  overwrite = true
}

resource "aws_ssm_parameter" "MYSQL_PASSWORD" {
  name      = join("/", ["", var.namespace, "MYSQL_PASSWORD"])
  type      = "String"
  value     = aws_rds_cluster.cas.master_password
  overwrite = true
}
