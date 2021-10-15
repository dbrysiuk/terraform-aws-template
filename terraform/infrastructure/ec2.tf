module "ec2-vdi" {
  source = "../../modules/my-first-ec2"

  project_prefix = "rpa-orchestrator"
  env            = var.env
  instance_type = var.instance_type

}