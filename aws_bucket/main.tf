module "bucket" {
  source              = "./modules/aws_bucket/"
  s3_bucket_name      = var.s3_bucket_name
  dynamodb_table_name = var.dynamodb_table_name
}