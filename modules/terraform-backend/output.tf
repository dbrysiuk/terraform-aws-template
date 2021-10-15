output "bucket" {
  description = "Backend bucket for terraform state file"
  value       = aws_s3_bucket.terraform-state-backend-bucket.id
}

output "key" {
  description = "Key name inside which remote state file will be stored"
  value       = "remote-state"
}

output "region" {
  description = "Region"
  value       = data.aws_region.current.name
}

output "dynamodb_table" {
  description = "State lock table for terraform backend"
  value       = aws_dynamodb_table.terraform-state-lock-table.id
}
