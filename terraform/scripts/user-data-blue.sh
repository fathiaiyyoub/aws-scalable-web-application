#!/bin/bash
yum update -y
yum install -y httpd aws-cli

systemctl enable httpd
systemctl start httpd

mkdir -p /var/www/html/blue
cd /var/www/html/blue

aws s3 cp s3://arr-bucket-fathi-2026/hw-blue.css ./
aws s3 cp s3://arr-bucket-fathi-2026/hw-blue-py.css ./
aws s3 cp s3://arr-bucket-fathi-2026/python.png ./
aws s3 cp s3://arr-bucket-fathi-2026/apache.svg ./
aws s3 cp s3://arr-bucket-fathi-2026/blue-index.html ./index.html

cd /var/www/html

aws s3 cp s3://arr-bucket-fathi-2026/hw-blue.css ./
aws s3 cp s3://arr-bucket-fathi-2026/hw-blue-py.css ./
aws s3 cp s3://arr-bucket-fathi-2026/python.png ./
aws s3 cp s3://arr-bucket-fathi-2026/apache.svg ./
aws s3 cp s3://arr-bucket-fathi-2026/blue-root-index.html ./index.html

systemctl restart httpd