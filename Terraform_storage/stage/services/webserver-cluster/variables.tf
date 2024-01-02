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

variable "db_remote_state_bucket" {
  description = "The Name of the remote state"
  type = string

}

variable "db_remote_state_key" {
  description = "The name of the key in the remote state"
  type = string
}

variable "region" {
  type = string
  description = "Region where the remote state is stored"
  default = "us-east-1"
}
