variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "lambda_role_name" {
  description = "Name of the existing IAM role for Lambda"
  type        = string
  default     = "CALambdaRol"
}

variable "lambda_filename" {
  description = "Path to the Lambda function zip file"
  type        = string
  default     = "function.zip"
}

variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "Cars_TF_Actions"
}

variable "table_name" {
  description = "Name of the DynamoDB table"
  type        = string
  default     = "Cars-TF"
}

variable "api_name" {
  description = "Name of the API Gateway API"
  type        = string
  default     = "Cars_TF_Actions_API"
}

variable "route_key" {
  description = "Route key for the API Gateway route"
  type        = string
  default     = "POST /car"
}

variable "python_version" {
  description = "Route key for the API Gateway route"
  type        = string
  default     = "python3.10"
}