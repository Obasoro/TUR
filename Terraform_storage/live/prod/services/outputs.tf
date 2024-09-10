output "public_ip" {
  value       = aws_instance.webserver.public_ip
  description = "webserver public ip address"
}

output "alb_dns_name" {
  value       = aws_lb.webserver.dns_name
  description = "Domain name of the load balancer"
}