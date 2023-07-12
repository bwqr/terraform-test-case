data "terraform_remote_state" "vpc" {
  backend = "local"

  config = {
    path = "../vpc/terraform.tfstate"
  }
}

provider "aws" {
  region = data.terraform_remote_state.vpc.outputs.region
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = var.pubkey
}

resource "aws_security_group" "main" {
  name   = "sg_22_80_443"
  vpc_id = data.terraform_remote_state.vpc.outputs.id

  # SSH access from the VPC
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
}

resource "aws_autoscaling_group" "web-asg" {
  name                 = "aws-asg"
  max_size             = var.asg_capacity
  min_size             = var.asg_capacity
  desired_capacity     = var.asg_capacity
  force_delete         = true
  launch_configuration = aws_launch_configuration.web-lc.name
  # load_balancers       = [aws_elb.web-elb.name]

  vpc_zone_identifier = data.terraform_remote_state.vpc.outputs.subnet_ids

  tag {
    key                 = "Name"
    value               = "web-asg"
    propagate_at_launch = "true"
  }
}

resource "aws_launch_configuration" "web-lc" {
  name          = "aws-lc"
  image_id      = var.ami_type
  instance_type = var.instance_type
  associate_public_ip_address = true
  key_name = aws_key_pair.deployer.key_name

  # Security group
  security_groups = [aws_security_group.main.id]
  user_data       = file("../scripts/install.sh")
}
