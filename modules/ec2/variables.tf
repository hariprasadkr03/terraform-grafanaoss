variable "public_subnet_id" {}
variable "ec2_sg_id" {}
variable "instance_type" {}
variable "key_pair_name" {}
variable "grafana_admin_password" {}
variable "rds_endpoint" {}
variable "db_user" { default = "grafana" }
variable "db_pass" {}
