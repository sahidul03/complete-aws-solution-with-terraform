rds_cluster = {
  engine              = "aurora-mysql"
  engine_version      = "8.0.mysql_aurora.3.02.0"
  family              = "aurora-mysql8.0"
  database_name       = "cas_dev"
  skip_final_snapshot = true
}

rds_cluster_instance = {
  count          = 1
  instance_class = "db.t4g.medium"
}


# Please define your master_username and master_password like below -
# secret = {
#   master_username = "database_username"
#   master_password = "database_password"
# }
