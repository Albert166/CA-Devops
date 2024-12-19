output "bucket_name" {
  value       = module.bucket.name
  sensitive   = false
  description = "aws s3 bucket name for terraform state name"
}