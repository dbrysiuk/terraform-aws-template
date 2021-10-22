resource "aws_db_instance" "database" {
  identifier                = "test-${var.env}-mssql-db-${random_string.random.result}"
  engine                    = var.db_engine
  instance_class            = var.db_instance_type
  username                  = var.db_user
  password                  = var.db_password
  db_subnet_group_name      = aws_db_subnet_group.default.name
  vpc_security_group_ids    = [aws_security_group.default.id]
  skip_final_snapshot       = true
  allocated_storage         = var.db_storage
}