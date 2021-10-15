resource "aws_db_subnet_group" "default" {
  name = "${var.project_prefix}-main"
  subnet_ids = var.subnet_ids

  tags = {
    Component = var.project_prefix
  }
}

resource "aws_security_group" "default" {
  name = "${var.project_prefix}-main"
  vpc_id      = var.vpc_id

  ingress = [
    {
      description      = "allow all"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress = [
    {
      description      = "allow all"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  tags = {
    Component = var.project_prefix
  }
}

resource "aws_db_instance" "database" {
  identifier                = "test-${var.env}-mssql-db-${random_string.random.result}"
  engine                    = var.db_engine
  instance_class            = var.db_instance_type
  username                  = var.db_user
  password                  = var.db_password
  db_subnet_group_name      = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.default.id]
  skip_final_snapshot  = true
  allocated_storage     = var.db_storage
}