resource "null_resource" "schema" {
  provisioner "local-exec" {
    command = <<EOF
curl -s -L -o /tmp/mysql.zip "https://github.com/roboshop-devops-project/mysql/archive/main.zip"
cd /tmp
unzip -o mysql.zip
cd mysql-main
mysql -h ${aws_db_instance.main.address} -u${jsondecode(data.aws_secretsmanager_secret_version.secret.secret_string)["RDS_MYSQL_USER"]} -p${jsondecode(data.aws_secretsmanager_secret_version.secret.secret_string)["RDS_MYSQL_PASS"]} < shipping.sql
EOF
  }
}