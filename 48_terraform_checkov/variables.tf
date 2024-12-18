variable "aws_region" {
    description = "AWS region"
    type        = string
    default     = "eu-central-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_a" {
  description = "CIDR block for the Subnet"
  default     = "10.0.1.0/24"
}

variable "subnet_cidr_b" {
  description = "CIDR block for the Subnet"
  default     = "10.0.2.0/24"
}

variable "availability_zone_a" {
  description = "Availability zone for the Subnet"
  default     = "eu-central-1a"
}

variable "availability_zone_b" {
  description = "Availability zone for the Subnet"
  default     = "eu-central-1b"
}

variable "type" {
    description       = "type of the instance"
    type              = string
    default           = "t2.micro"

    validation {
        condition     = contains(["t3.micro","t4g.small","t2.micro"], var.type)
        error_message = "Invalid type selected, can only be t3.micro , t4g.small or t2.micro"
    }
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-0a628e1e89aaedf80" # Ubuntu AMI
}