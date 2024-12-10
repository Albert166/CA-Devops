provider "aws" {
  region = "eu-central-1"
}

# IAM Policy for Read-Only Access to EC2 and S3
resource "aws_iam_policy" "create_instance_policy" {
  name        = "CreateInstancePolicy"
  description = "Provides Ec2 create role"
  policy = jsonencode({
    Version = "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "ec2:Describe*",
          "ec2:GetConsole*"
        ],
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : "ec2:RunInstances",
        "Resource" : [
          "arn:aws:ec2:*:*:subnet/*",
          "arn:aws:ec2:*:*:network-interface/*",
          "arn:aws:ec2:*:*:instance/*",
          "arn:aws:ec2:*:*:volume/*",
          "arn:aws:ec2:*::image/ami-*",
          "arn:aws:ec2:*:*:key-pair/*",
          "arn:aws:ec2:*:*:security-group/*"
        ]
      }
    ]
  })
}

# IAM Role
resource "aws_iam_role" "create_instance_role" {
  name = "CreateInstanceRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach Policy to Role
resource "aws_iam_role_policy_attachment" "create_instance_attach" {
  role       = aws_iam_role.create_instance_role.name
  policy_arn = aws_iam_policy.create_instance_policy.arn
}

# Create IAM Users
resource "aws_iam_user" "users" {
  count = 1
  name  = "Create_instance-${count.index + 1}"
}

# Create access key for the user

resource "aws_iam_access_key" "create_instance" {
  count = length(aws_iam_user.users)
  user  = aws_iam_user.users[count.index].name
}

# Attach Role to Users
resource "aws_iam_user_policy_attachment" "attach_users_to_policy" {
  count      = length(aws_iam_user.users)
  user       = aws_iam_user.users[count.index].name
  policy_arn = aws_iam_policy.create_instance_policy.arn
}

# Output
output "user_names" {
  value = aws_iam_user.users[*].name
}

output "user_id" {
  value = aws_iam_user.users[*].id
}

output "secret" {
  value = aws_iam_access_key.create_instance[*].secret
  sensitive = true
}

output "tmp_psw" {
  value = aws_iam_access_key.create_instance[*].ses_smtp_password_v4
  sensitive = true
}

output "access_key" {
  value = aws_iam_user.users[*].unique_id
}

