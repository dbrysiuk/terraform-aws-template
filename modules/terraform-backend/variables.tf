variable "project_prefix" {
  description = "All resources of this project is identified by this prefix, preferred separator is - instead of _ as _ is not allowed in s3 bucket names"
  type = string
}