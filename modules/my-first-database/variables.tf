variable "project_prefix" {
  type = string
}
variable "env" {
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

################## RDS ######################
variable "db_engine" {
  type = string
}
variable "db_storage" {
  type = string
}
variable "db_instance_type" {
  type = string
}
variable "db_user" {
  sensitive = true
  type = string
}
variable "db_password" {
  sensitive = true
  type = string
}