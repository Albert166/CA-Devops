# VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "main-vpc-${terraform.workspace}"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main-igw-${terraform.workspace}"
  }
}

# Route Table
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "main-route-table-${terraform.workspace}"
  }
}

# Subnet
resource "aws_subnet" "main-a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr_a
  availability_zone = var.availability_zone_a
  tags = {
    Name = "main-subnet-${terraform.workspace}"
  }
}

resource "aws_subnet" "main-b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr_b
  availability_zone = var.availability_zone_b
  tags = {
    Name = "main-subnet-${terraform.workspace}"
  }
}

# Security Group
resource "aws_security_group" "https" {
  vpc_id = aws_vpc.main.id
  name   = "Allow Glogal HTTP ${terraform.workspace}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["88.118.178.202/32"]
    description = "My http access"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["88.118.178.202/32"]
    description = "My https access"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["88.118.178.202/32"]
    description = "My https access"
  }

  tags = {
    Name = "main-security-group-${terraform.workspace}"
    Source = "Global"
  }
}

resource "aws_security_group" "ssh" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["88.118.178.202/32"]
    description = "My ssh access"
  }
  tags = {
    Name = "ssh-security-group-${terraform.workspace}"
    Source = "Global"
  }
}

# ALB
resource "aws_lb" "main" {
  name               = "main-alb-${terraform.workspace}"
  internal           = false
  security_groups    = [aws_security_group.https.id, aws_security_group.ssh.id]
  subnets            = [aws_subnet.main-a.id,aws_subnet.main-b.id]
  load_balancer_type = "application"
  drop_invalid_header_fields = true

  enable_deletion_protection = true
  tags = {
    Name = "main-alb-${terraform.workspace}"
  }
}

# Target Group
resource "aws_lb_target_group" "catargetgroup" {
  name        = "example-tg-${terraform.workspace}"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "instance"

  health_check {
    path                = "/"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "CA_ALB_TG-${terraform.workspace}"
  }
}

# ALB Listener
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.catargetgroup.arn
  }
}

module ec_1 {
  source            = "./modules/ec2"
  ami_id            = var.ami
  instance_type     = var.type
  key_name          = "EC2Key1"
  vpc_id            = aws_vpc.main.id
  subnet_id         = aws_subnet.main-a.id
  instance_name     = "Instance01-${terraform.workspace}"
  security_groups    = [aws_security_group.https.id, aws_security_group.ssh.id]
  aws_lb_target_group = aws_lb_target_group.catargetgroup.arn
}

module ec_2 {
  source            = "./modules/ec2"
  ami_id            = var.ami
  instance_type     = var.type
  key_name          = "EC2Key1"
  vpc_id            = aws_vpc.main.id
  subnet_id         = aws_subnet.main-a.id
  instance_name     = "Instance02-${terraform.workspace}"
  security_groups    = [aws_security_group.https.id, aws_security_group.ssh.id]
  aws_lb_target_group = aws_lb_target_group.catargetgroup.arn
}

module ec_3 {
  source            = "./modules/ec2"
  ami_id            = var.ami
  instance_type     = var.type
  key_name          = "EC2Key1"
  vpc_id            = aws_vpc.main.id
  subnet_id         = aws_subnet.main-a.id
  instance_name     = "Instance03-${terraform.workspace}"
  security_groups    = [aws_security_group.https.id, aws_security_group.ssh.id]
  aws_lb_target_group = aws_lb_target_group.catargetgroup.arn
}