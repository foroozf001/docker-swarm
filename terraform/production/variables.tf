# Input Variables
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "eu-west-1"
}

variable "ec2_instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t3.micro"
}

variable "allowed_ips" {
  description = "my home ip address"
  type        = list(string)
  default     = ["82.217.167.135/32"]
}

variable "tags" {
  description = "service tags"
  type        = map(string)
  default = {
    "app" = "swarm"
  }
}