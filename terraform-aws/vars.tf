variable "REGION" {
  default = "eu-north-1"
}

variable "ZONE1" {
  default = "eu-north-1a"
}

variable "ZONE2" {
  default = "eu-north-1b"
}

variable "ZONE3" {
  default = "eu-north-1c"
}

variable "AMIS" {
  default = {
    eu-north-1 = "ami-08eb150f611ca277f"
  }
}

variable "USER" {
  default = "ubuntu"
}

variable "PUB_KEY" {
  default = "EC2Key"
}
