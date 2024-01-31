variable "server_port" {
  description = "The port of the server"
  type        = number
  default     = 8080
}

variable "alb_name" {
  description = "The name of the ALB"
  type        = string
  default     = "terraform-asg-webserver"

}

variable "instance_security_group_name" {
  description = "The name of the security EC2 instance security"
  type        = string
  default     = "terraform-webserver-instance"

}

variable "alb_security_group_name" {
  type        = string
  description = "The name of the security group for the ALB"
  default     = "terraform-webserver-alb"
}



variable "region" {
  type        = string
  description = "Region where the remote state is stored"
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type        = string
}

variable "db_remote_state_bucket" {
  description = "the name of the bucket to use for all the remote state"
  type        = string
}

variable "db_remote_state_key" {
  description = "the path to the key in the remote state"
  type        = string
}

variable "instance_type" {
  description = "The typr of EC2 instances to run (e.g. t2.micro)"
  type        = string
}
