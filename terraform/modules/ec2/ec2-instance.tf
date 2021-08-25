resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  key_name               = "private"
  instance_type          = var.ec2_instance_type
  count                  = 3
  subnet_id              = aws_subnet.web.id
  vpc_security_group_ids = [aws_security_group.web.id, aws_security_group.ssh.id, aws_security_group.swarm.id]
  tags                   = var.tags
  depends_on             = [aws_internet_gateway.web]
}