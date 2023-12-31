provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "webserver" {
  ami                    = "ami-0c7217cdde317cfec"
  instance_type          = terraform.workspace == "default" ? "t2.medium" : "t2.micro"
}

terraform {
  backend "s3" {
    bucket = "kunle-storage-tur"
    key = "workspaces-webserver/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "kunle-tur"
    encrypt = true
  }
}