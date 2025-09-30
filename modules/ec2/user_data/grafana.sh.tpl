#!/bin/bash
yum update -y
amazon-linux-extras install docker -y || yum install -y docker
service docker start
usermod -a -G docker ec2-user

docker run -d --name grafana \
  -p 3000:3000 \
  -e GF_SECURITY_ADMIN_PASSWORD=${grafana_admin_password} \
  -e GF_DATABASE_TYPE=mysql \
  -e GF_DATABASE_HOST=${rds_endpoint}:3306 \
  -e GF_DATABASE_NAME=grafanadb \
  -e GF_DATABASE_USER=${db_user} \
  -e GF_DATABASE_PASSWORD=${db_pass} \
  grafana/grafana:latest
