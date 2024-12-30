module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.17.0"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_instance" "for_each_example" {
  for_each = var.project

  ami           = "ami-0a628e1e89aaedf80"
  instance_type = each.value.instance_type
  key_name      = var.key
  monitoring    = false
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Name = each.value.Environment
  }
}

resource "aws_instance" "ec2_instance" {
  count = var.create =="true" ? 1 : 0
  ami           = "ami-0a628e1e89aaedf80"
  instance_type = var.type
  key_name      = var.key
  monitoring    = false
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
 
  tags = {
    Name = "Count example"
  }
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "albertsomething-1"
}