
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "webserver" {
  ami           = "ami-0fb653ca2d3203aci"
  instance_type = "t2.micro"

  tags = {
    Name = Terraform_up_running
  }
}