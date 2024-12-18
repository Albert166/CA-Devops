variable "aws_region" {
  description = "The AWS region to deploy resources"
  default     = "eu-cetral-1"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-0a628e1e89aaedf80" # Ubuntu AMI
}

variable "instance_type" {
    description       = "type of the instance"
    type              = string
    default           = "t2.micro"

    validation {
        condition     = contains(["t3.micro","t4g.small","t2.micro"], var.instance_type)
        error_message = "Invalid type selected, can only be t3.micro , t4g.small or t2.micro"
    }
}


variable "key_name" {
  description = "Name of the SSH key pair"
  default     = "EC2Key" 
}

variable "vpc_id" {
  description = "VPC ID where the instance will be launched"
}

variable "subnet_id" {
  description = "Subnet ID where the instance will be launched"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  default     = "basic-ec2"
}

variable security_groups {
  description = "security groups"
  type        = list(string)
}

variable aws_lb_target_group {
  type        = string
  default     = ""
  description = "AWS Target group arn"
}