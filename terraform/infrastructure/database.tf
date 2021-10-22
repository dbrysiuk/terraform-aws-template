module "database" {
  source = "../../modules/my-first-database"


  project_prefix     = "test-database"
  env                = var.env

  db_password        = var.db_password
  db_user            = var.db_user
  db_instance_type   = var.db_instance_type
  db_storage         = var.db_storage
  db_engine          = var.db_engine

  vpc_id             = var.vpc_id
  security_group_ids = var.security_group_ids
  subnet_ids         = var.subnet_ids

}