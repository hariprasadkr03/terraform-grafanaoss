terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = ">= 4.0" }
    grafana = { source = "grafana/grafana", version = ">= 1.0" }
  }
}

provider "aws" {
  region = var.aws_region
}

provider "grafana" {
  url  = var.grafana_url
  auth = var.grafana_admin_token
}
