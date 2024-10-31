# main.tf in terraform-aws-free-tier-ec2 module


# Look for an existing security group by name
data "aws_security_group" "existing_sg" {
  filter {
    name   = "group-name"
    values = [var.security_group_name]
  }

  #filter {
  # name   = "vpc-id"
  #values = [var.vpc_id] # Make sure to specify the correct VPC ID
  #}
}
resource "aws_security_group" "demo" {
  name        = var.security_group_name
  description = "Demo security group"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 81
    to_port     = 81
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "project_demo" {
  ami           = var.ami_id
  instance_type = var.instance_type
  #vpc_security_group_ids = [aws_security_group.demo.id]
  vpc_security_group_ids = length(data.aws_security_group.existing_sg.id) > 0 ? [data.aws_security_group.existing_sg.id] : [aws_security_group.demo[0].id]

  tags = {
    Name = var.instance_name
  }

  user_data = var.user_data
  #user_data = <<-EOF
  #           #!/bin/bash
  #          sudo apt-get update
  #         sudo apt-get install -y ansible
  #        EOF
}
