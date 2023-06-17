
variable "aws_credentials" {
  type = map(any)
  default = {
    region     = "us-east-1"
    access_key = ""
    secret_key = ""
    token      = ""
  }
}

variable "lambda_function" {
  type = map(any)
  default = {
    function_name = "lambda_greet"
    greeting_msg  = "Greeting from AWS Lambda!"
  }
}

variable "lambda_archive" {
  type = map(any)
  default = {
    type        = "zip"
    filepath    = "./tmp/greet_lambda.zip"
    source_file = "greet_lambda.py"
  }
}
