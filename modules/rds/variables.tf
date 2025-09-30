variable "vpc_id" {}
variable "subnet_ids" { type = list(string) }
variable "username" { type = string }
variable "password" { type = string }
variable "db_sg_id" { type = string }
