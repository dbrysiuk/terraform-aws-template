variable "profile" {
  description = "AWS environment account"
  type = string
}

variable "region" {
  description = "Region where TF would deploy resources"
  type        = string
  default     = "eu-central-1"
}

variable "deployment_role_arn" {
  description = "Role arn that can deploy in a given environment, value to be provided in respective env_vars"
  type        = string
}

variable "tf_version" {
  description = "Terraform version that used for the project"
  type = string
}
variable "env" {
  description = "Environment"
  type = string
}
variable "db_user" {
  description = "Database admin user name"
  sensitive = true
  type      = string
}
variable "db_password" {
  description = "Database admin user password"
  sensitive = true
  type      = string
}

variable "project_version" {}

variable "instance_type" {
  description = "EC2 instance type"
  type = string
  default = "t2.micro"
}
variable "key_name" {
  description = "Name of key pair security credentials"
  type = string
}
variable "db_instance_type" {
  description = "Database instance type"
  type = string
  default = "db.t3.small"
}
variable "db_storage" {
  description = "Database initial storage space"
  type = string
  default = "250"
}
variable "db_engine" {
  description = "Database engine definition"
  type = string
  default = "sqlserver-ex"
}
variable "vpc_id" {
  description = "Virtual Private Cloud Network ID"
  type = string
}
variable "subnet_ids" {
  description = "Range of IP addresses in VPC"
  type = list(string)
}
variable "security_group_ids" {
  description = "Virtual Firewall"
  type = list(string)
}
