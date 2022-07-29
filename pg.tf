//parameter group for configuration details of rds. we go
//with normal inbuilts parameters through code. you can check
//these in aws rds service options

resource "aws_db_parameter_group" "main" {
  name   = "${local.TAG_PREFIX}-pg"
  family = var.PG_FAMILY
}