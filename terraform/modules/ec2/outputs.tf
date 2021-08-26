output "publicIPs" {
  value = aws_instance.web[*].public_ip
}