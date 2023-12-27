
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
  ami                    = "ami-0c7217cdde317cfec"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.webserver_sg.id]

  user_data                   = <<-EOF
                #!/bin/bash
                echo "Hello World!" > inex.html
                nohup busybox http -f -p $(var.server_port) &
                EOF
  user_data_replace_on_change = true

  tags = {
    Name = "Terraform_up_running"
  }
}

resource "aws_security_group" "webserver_sg" {
  name = "terraform_security_group"

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_autoscaling_group" "webserver" {
  launch_configuration = aws_launch_configuration.webserver.name
  min_size             = 2
  max_size             = 10

  tag {
    key                 = "Name"
    value               = "terraform-asg-webserver"
    propagate_at_launch = true
  }

}
resource "aws_launch_configuration" "webserver" {
  image_id        = "ami-0c7217cdde317cfec"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.webserver_sg.id]

  user_data = <<-EOF
                #!/bin/bash
                echo "Hello World!" > inex.html
                nohup busybox http -f -p $(var.server_port) &
                EOF
    lifecycle {
    create_before_destroy = true
  }
}