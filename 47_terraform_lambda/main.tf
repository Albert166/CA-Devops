terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.79.0"
    }
  }
}

data "aws_iam_role" "CALambdaRol" {
  name = var.lambda_role_name
}

resource "aws_dynamodb_table" "TF_table" {
  name         = var.table_name
  hash_key     = "Cars_id"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "Cars_id"
    type = "S"
  }

}

resource "aws_lambda_function" "cars_function" {
  filename      = var.lambda_filename
  function_name = var.function_name
  handler       = "function.lambda_handler" # filename.function(in file e.g. function.py inside def lamda_handler)
  runtime       = var.python_version
  role          = data.aws_iam_role.CALambdaRol.arn

  environment {
    variables = {
      TABLE_NAME = var.table_name
    }
  }

  source_code_hash = filebase64sha256(var.lambda_filename)
}
# API Gateway REST API
resource "aws_api_gateway_rest_api" "cars_api" {
  name        = var.api_name
  description = "API for managing cars"
}

# API Gateway Resource for /cars
resource "aws_api_gateway_resource" "cars_resource" {
  rest_api_id = aws_api_gateway_rest_api.cars_api.id
  parent_id   = aws_api_gateway_rest_api.cars_api.root_resource_id
  path_part   = "cars"
}

# API Gateway Method (POST)
resource "aws_api_gateway_method" "post_method" {
  rest_api_id   = aws_api_gateway_rest_api.cars_api.id
  resource_id   = aws_api_gateway_resource.cars_resource.id
  http_method   = "POST"
  authorization = "NONE"
}

# API Gateway Integration
resource "aws_api_gateway_integration" "lambda_integration" {
  rest_api_id      = aws_api_gateway_rest_api.cars_api.id
  resource_id      = aws_api_gateway_resource.cars_resource.id
  http_method      = aws_api_gateway_method.post_method.http_method
  content_handling = "CONVERT_TO_TEXT"

  integration_http_method = "POST"
  type                    = "AWS"
  uri                     = aws_lambda_function.cars_function.invoke_arn
}

resource "aws_api_gateway_method_response" "response_200" {
  rest_api_id = aws_api_gateway_rest_api.cars_api.id
  resource_id = aws_api_gateway_resource.cars_resource.id
  http_method = aws_api_gateway_method.post_method.http_method
  status_code = "200"
}

# API Gateway Deployment
resource "aws_api_gateway_deployment" "cars_deployment" {
  depends_on  = [aws_api_gateway_integration.lambda_integration]
  rest_api_id = aws_api_gateway_rest_api.cars_api.id
}

resource "aws_api_gateway_stage" "example" {
  deployment_id = aws_api_gateway_deployment.cars_deployment.id
  rest_api_id   = aws_api_gateway_rest_api.cars_api.id
  stage_name    = "prod"
}

# Lambda Permission to Allow API Gateway to Invoke It
resource "aws_lambda_permission" "apigw_invoke_permission" {
  statement_id  = "AllowApiGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.cars_function.arn
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.cars_api.execution_arn}/*/*"
}

# Output for API Gateway Endpoint
output "api_endpoint" {
  description = "URL of the API Gateway endpoint"
  value       = "https://${aws_api_gateway_rest_api.cars_api.id}.execute-api.${var.region}.amazonaws.com/prod/cars"
}