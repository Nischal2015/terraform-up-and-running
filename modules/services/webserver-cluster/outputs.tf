output "alb_dns_name" {
  value       = aws_lb.example.dns_name
  description = "The domain name of load balancer"
}

output "asg_name" {
  value       = aws_autoscaling_group.example-asg.name
  description = "The name of the Auto Scaling Group"
}

output "alb_security_group_id" {
  value       = aws_security_group.alb.id
  description = "The ID of the security Group attached to the load balancer"
}
