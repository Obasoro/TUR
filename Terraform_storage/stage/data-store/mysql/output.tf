output "adding new" {
  value       = aws_db_instance.webserver.address
  description = "connect to the database at this endpoint"

}

output "port" {
  value       = aws_db_instance.webserver.port
  description = "The port the database is connected to"
}