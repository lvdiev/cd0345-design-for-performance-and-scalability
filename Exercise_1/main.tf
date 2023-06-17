provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  token      = var.aws_token
}

resource "aws_instance" "udacity_dev_t2" {
  count         = 4
  ami           = "ami-04581fbf744a7d11f"
  instance_type = "t2.micro"
  subnet_id     = "subnet-07ba9c1c2e3159476"
  tags = {
    Name        = "Udacity T2"
    Environment = "dev"
  }
}

resource "aws_instance" "udacity_dev_m4" {
  count         = 2
  ami           = "ami-04581fbf744a7d11f"
  instance_type = "m4.large"
  subnet_id     = "subnet-07ba9c1c2e3159476"
  tags = {
    Name        = "Udacity M4"
    Environment = "dev"
  }
}
