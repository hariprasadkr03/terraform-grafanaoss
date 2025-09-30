resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "grafana-rds-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "rds" {
  identifier = "grafana-free-rds"
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t2.micro"
  db_name              = "grafanadb"
  username             = var.username
  password             = var.password
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [var.db_sg_id]
  skip_final_snapshot  = true
  publicly_accessible  = false
  storage_type         = "gp2"
}

output "endpoint" { value = aws_db_instance.rds.endpoint }
