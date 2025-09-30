output "grafana_public_ip" { value = module.ec2_grafana.public_ip }
output "rds_endpoint" { value = module.rds.endpoint }
output "vpc_id" { value = module.network.vpc_id }
