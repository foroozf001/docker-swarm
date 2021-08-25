# Input Variables
variable "ec2_instance_type" {
  type = string
}

variable "allowed_ips" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}