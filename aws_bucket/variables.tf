variable "s3_bucket_name" {
  description = "Name for terraform state bucket"
  type        = string
  default     = "albertt-terraform-state"
}

variable "dynamodb_table_name" {
  description = "Name for terraform state lock table"
  type        = string
  default     = "albertt-terraform-state-lock"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}