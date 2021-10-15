module "test-terraform" {
  source = "../../modules/terraform-backend"
  project_prefix = "test-terraform"
}

// Outputting backend-config for you, which will be useful later -> Copy output to backend-config.hcl files
output "bucket" {
  value = module.test-terraform.bucket
}

output "key" {
  value = module.test-terraform.key
}

output "region" {
  value = module.test-terraform.region
}

output "dynamodb_table" {
  value = module.test-terraform.dynamodb_table
}