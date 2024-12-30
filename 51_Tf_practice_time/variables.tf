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

variable "project"{
    description = "Map of project names to configuration"
    type        = map(any)
    default     = {
        client-webapp= {
            instance_type = "t2.micro"
            Environment   = "dev"
        },
        internal-webapp={
            instance_type = "t2.nano"
            Environment   = "test"
        }
    }
}

variable "create" {
  description = "Whether to create the EC2 instance"
  type        = string
  default     = "false"
}