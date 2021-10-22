// Identifier of the mssql DB instance.
output "mssql_id" {
  value = aws_db_instance.database.id
}
// Address of the mssql DB instance.
output "mssql_address" {
  value = aws_db_instance.database.address
}