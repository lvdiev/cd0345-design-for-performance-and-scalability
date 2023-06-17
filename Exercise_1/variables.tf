variable "aws_region" {
    type = string
    default = "us-east-1"
}

variable "aws_access_key" {
    type = string
}

variable "aws_secret_key" {
    type = string
}

variable "aws_token" {
    type = string
}

variable "subnet_pub1a" {
  description = "public Subnet 1a"
  default = "subnet-07ba9c1c2e3159476"
}

variable "subnet_pub1b" {
  description = "public Subnet 1b"
  default = "subnet-003f7e436256be757"
}
