module "my-first-s3" {
  source = "../00_generic/s3"
  bucket_name = "${var.project_prefix}-store-bucket-${var.env}-${random_string.random.result}"
  key_id = module.kms_key.kms_key.id
  force_destroy = true
  versioning = false
}