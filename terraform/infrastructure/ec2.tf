module "ec2-vdi" {
  source = "../../modules/my-first-ec2"

  project_prefix      = "project-server"
  env                 = var.env
  instance_type       = var.instance_type
  key_name            = var.key_name

}