module "main" {
  source            = "../modules/ec2"
  ec2_instance_type = var.ec2_instance_type
  allowed_ips       = var.allowed_ips
  tags              = var.tags
} 