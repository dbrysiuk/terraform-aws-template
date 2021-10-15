module "kms_key" {
  source = "../../modules/00_generic/kms"
  name = "bucket-store"
  env = var.env
  project_prefix = var.project_prefix
}