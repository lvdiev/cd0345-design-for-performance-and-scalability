provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  token      = var.aws_token
}

resource "aws_instance" "dev_udacity_t2" {
  count         = 4
  ami           = "ami-04581fbf744a7d11f"
  instance_type = "t2.micro"
  subnet_id     = var.subnet_pub1a
  tags = {
    Name        = "Udacity T2"
    Environment = "dev"
  }
}

resource "aws_instance" "dev_udacity_m4" {
  count         = 2
  ami           = "ami-04581fbf744a7d11f"
  instance_type = "m4.large"
  subnet_id     = var.subnet_pub1a
  tags = {
    Name        = "Udacity M4"
    Environment = "dev"
  }
}
