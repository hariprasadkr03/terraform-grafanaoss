variable "aws_region" { type = string }
variable "vpc_cidr" {
  type    = string
  default = "10.20.0.0/16"
}
variable "public_subnet_cidr" {
  type    = string
  default = "10.20.1.0/24"
}
variable "private_subnet_cidr" {
  type    = string
  default = "10.20.1.0/24"
}
variable "instance_type" {
  type = string 
  default = "t2.micro" 
}

variable "key_pair_name" { type = string }
variable "ssh_allowed_cidr" { 
  type = string 
  default = "0.0.0.0/0" 
  }
variable "db_username" { 
  type = string 
  default = "grafana" 
  }
variable "db_password" { 
  type = string 
  sensitive = true 
  }
variable "grafana_admin_password" { 
  type = string 
  sensitive = true 
  }
variable "grafana_url" { 
  type = string 
  default = "" 
  }
variable "grafana_admin_token" { 
  type = string 
  default = "" 
  }
variable "tfstate_bucket" { type = string }
variable "tfstate_dynamodb_table" { type = string }
