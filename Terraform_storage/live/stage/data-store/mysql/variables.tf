variable "db_username" {
  description = "The username for the database"
  type        = string
  sensitive   = true

}

variable "db_password" {
  description = "password for the db"
  type        = string
  sensitive   = true

}

variable "db_name" {
  description = "The database name"
  type        = string
  default     = "webservdb"
}