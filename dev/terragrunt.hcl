remote_state {
  backend = "s3"
  config = {
    bucket  = "complete-aws-solution-terraform-state-dev"
    key     = "${path_relative_to_include()}.tfstate"
    region  = "ap-northeast-1"
    encrypt = true
  }
}
