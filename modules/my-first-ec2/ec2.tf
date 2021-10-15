resource "aws_instance" "my-first-ec2" {
  ami               = data.aws_ami.server_ami.image_id
  instance_type     = var.instance_type
  availability_zone = var.zone
  key_name          = var.key_name

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.ec2-nic.id
  }

  user_data     = data.template_file.init.rendered

}