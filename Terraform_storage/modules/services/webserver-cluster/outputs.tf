output "public_ip" {
  value       = aws_instance.webserver.public_ip
  description = "webserver public ip address"
}

output "alb_dns_name" {
  value       = aws_lb.webserver.dns_name
  description = "Domain name of the load balancer"
}

output "asg_name" {
  value = aws_autoscaling_group.webserver.name
  description = "The name of the auto scaling group"
}

output "alb_security_group_id" {
  value = aws_security_group.alb.id
  description = "The ID of the security Group"
}

output "asg_name" {
  value = aws_autoscaling_group.webserver.name
  description = "Name of the autoscale group that manages webservers."
}