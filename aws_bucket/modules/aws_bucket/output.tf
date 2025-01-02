output "name" {
  value       = aws_s3_bucket.s3_bucket.bucket
  description = "aws s3 bucket name for terraform state name"
}
