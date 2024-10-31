variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-04b70fa74e45c3917"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Tag for naming the instance"
  type        = string
  default     = "project-server"
}


variable "security_group_name" {
  description = "Security Group Name"
  type        = string
  default     = "demo_sg"

}

variable "user_data" {
  description = "User data script to be run on instance launch"
  type        = string
  default     = "null"
}
