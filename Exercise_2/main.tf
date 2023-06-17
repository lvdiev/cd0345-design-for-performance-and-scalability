provider "aws" {
  region     = var.aws_credentials["region"]
  access_key = var.aws_credentials["access_key"]
  secret_key = var.aws_credentials["secret_key"]
  token      = var.aws_credentials["token"]
}

data "archive_file" "lambda_zip" {
  type        = var.lambda_archive["type"]
  output_path = var.lambda_archive["filepath"]
  source_file = var.lambda_archive["source_file"]
}

resource "aws_iam_role" "udacity_terraform_lambda_role" {
  name = "udacity_terraform_lambda_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}

data "aws_iam_policy_document" "lambda_logging" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["arn:aws:logs:*:*:*"]
  }
}

resource "aws_iam_policy" "lambda_logging" {
  name        = "lambda_logging"
  path        = "/"
  description = "IAM policy for logging from a lambda"
  policy      = data.aws_iam_policy_document.lambda_logging.json
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.udacity_terraform_lambda_role.name
  policy_arn = aws_iam_policy.lambda_logging.arn
}

# Create CloudWatch Group
resource "aws_cloudwatch_log_group" "example" {
  name              = "/aws/lambda/${var.lambda_function["function_name"]}"
  retention_in_days = 14
}

resource "aws_lambda_function" "udacity_lambda" {
  function_name = var.lambda_function["function_name"]
  runtime       = "python3.9"
  handler       = "greet_lambda.handler"
  role          = aws_iam_role.udacity_terraform_lambda_role.arn
  filename      = var.lambda_archive["filepath"]
  environment {
    variables = {
      greeting_msg = var.lambda_function["greeting_msg"]
    }
  }
}

