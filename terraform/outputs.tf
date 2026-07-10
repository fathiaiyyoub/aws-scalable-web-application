output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS"
  value       = aws_lb.alb.dns_name
}

output "website_url" {
  description = "Application URL"
  value       = "http://${aws_lb.alb.dns_name}"
}

output "red_url" {
  description = "Red application"
  value       = "http://red.${var.domain_name}"
}

output "blue_url" {
  description = "Blue application"
  value       = "http://blue.${var.domain_name}"
}