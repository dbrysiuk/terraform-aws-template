module "database" {
  source = "../../modules/my-first-database"


  project_prefix     = "test-database"
  env                = var.env

  db_password        = var.db_password
  db_user            = var.db_user
  db_instance_type   = var.db_instance_type
  db_storage         = var.db_storage
  db_engine          = var.db_engine

}