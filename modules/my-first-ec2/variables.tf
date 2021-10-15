variable "project_prefix" {
  type = string
}
variable "env" {
  type = string
}
variable "key_name" {
  type = string
}

variable "vpc_id" {
  type = string
}
variable "subnet_ids" {
  type = list(string)
}
variable "security_group_ids" {
  type = list(string)
}

variable "ami" {
  type = string
  default = "ami-0987e67be9fa15a33"
}
variable "instance_type" {
  type = string
  default = "m4.large"
}
variable "zone" {
  type = string
  default = "eu-central-1a"
}