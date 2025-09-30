terraform {
  required_version = ">= 1.2"
  backend "s3" {
    bucket         = var.tfstate_bucket
    key            = "grafana-free/terraform.tfstate"
    region         = var.aws_region
    dynamodb_table = var.tfstate_dynamodb_table
    encrypt        = true
  }
}
