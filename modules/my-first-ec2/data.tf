data "aws_ami" "server_ami" {
  most_recent = true
  owners = ["amazon", "self"]

  filter {
    name = "name"
    values = ["Windows_Server-2019-English-Full-Base-*"]
  }
}

data "template_file" "init" {
  template = <<EOF
    <<<put here script code if required>>>
EOF
}