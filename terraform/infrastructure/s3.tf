module "s3-store" {
  source = "../../modules/my-first-s3"

  env            = var.env
  project_prefix = "static-content-test"
}