resource "aws_instance" "grafana" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  key_name      = var.key_pair_name
  vpc_security_group_ids = [var.ec2_sg_id]
  user_data     = file("./modules/ec2/user_data/grafana.sh.tpl")
  root_block_device {
    volume_size = 8
    volume_type = "gp2"
  }
  tags = { Name = "grafana-free-ec2" }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

output "public_ip" { value = aws_instance.grafana.public_ip }
