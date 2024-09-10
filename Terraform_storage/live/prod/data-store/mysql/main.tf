provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "webserver" {
  identifier_prefix   = "kunle-tur"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
  skip_final_snapshot = true
  db_name             = var.db_name

  username = var.db_username
  password = var.db_password
}

terraform {
  backend "s3" {

    bucket         = "kunle-storage-tur"
    key            = "stage/data-store/mysql/terrafoam.tfstate"
    region         = "us-east-1"
    dynamodb_table = "kunle-tur"
    encrypt        = true

  }
}

data "terraform_remote_state" "db" {
  backend = "s3"

  config = {
    bucket = "kunle-storage-tur"
    key    = "stage/data-store/mysql/terrafoem.tfstate"
    region = "us-east-1"
  }
}