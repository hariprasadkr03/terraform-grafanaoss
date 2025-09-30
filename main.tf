module "network" {
  source = "./modules/network"
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

module "security" {
  source = "./modules/security"
  vpc_id           = module.network.vpc_id
  ssh_allowed_cidr = var.ssh_allowed_cidr
}

module "rds" {
  source = "./modules/rds"
  vpc_id         = module.network.vpc_id
  subnet_ids     = module.network.private_subnet_ids
  username       = var.db_username
  password       = var.db_password
  db_sg_id       = module.security.db_sg_id
}

module "ec2_grafana" {
  source = "./modules/ec2"
  public_subnet_id       = module.network.public_subnet_id
  ec2_sg_id              = module.security.ec2_sg_id
  instance_type          = var.instance_type
  key_pair_name          = var.key_pair_name
  grafana_admin_password = var.grafana_admin_password
  rds_endpoint           = module.rds.endpoint
  db_pass                = var.db_password
}
