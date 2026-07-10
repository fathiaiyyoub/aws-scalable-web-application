#!/bin/bash
yum update -y
yum install -y httpd aws-cli

systemctl enable httpd
systemctl start httpd

mkdir -p /var/www/html/red
cd /var/www/html/red

aws s3 cp s3://arr-bucket-fathi-2026/hw-red.css ./
aws s3 cp s3://arr-bucket-fathi-2026/hw-red-py.css ./
aws s3 cp s3://arr-bucket-fathi-2026/python.png ./
aws s3 cp s3://arr-bucket-fathi-2026/apache.svg ./
aws s3 cp s3://arr-bucket-fathi-2026/red-index.html ./index.html

cd /var/www/html

aws s3 cp s3://arr-bucket-fathi-2026/hw-red.css ./
aws s3 cp s3://arr-bucket-fathi-2026/hw-red-py.css ./
aws s3 cp s3://arr-bucket-fathi-2026/python.png ./
aws s3 cp s3://arr-bucket-fathi-2026/apache.svg ./
aws s3 cp s3://arr-bucket-fathi-2026/red-root-index.html ./index.html

systemctl restart httpd