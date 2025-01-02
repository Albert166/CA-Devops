variable "aws_region" {
  description = "The AWS region to deploy to"
  default     = "eu-central-1"
}

variable "key" {
  description = "The key pair name to use"
  default     = "EC2Key1"
}

variable "type" {
  description = "The type of instance to launch"
  default     = "t2.micro"
}

