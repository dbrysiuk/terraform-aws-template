resource "aws_network_interface" "ec2-nic" {
  subnet_id = var.subnet_ids[1]
  security_groups = [aws_security_group.ec2_sg.id]
}