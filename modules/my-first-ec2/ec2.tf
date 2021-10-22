resource "aws_instance" "my-first-ec2" {
  ami               = data.aws_ami.ubuntu.id
  instance_type     = var.instance_type
  key_name          = var.key_name
  user_data     = data.template_file.init.rendered
}