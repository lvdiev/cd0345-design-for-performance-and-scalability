variable "aws_region" {
    type = string
    default = "us-east-1"
}

variable "aws_access_key" {
    type = string
    default = ""
}

variable "aws_secret_key" {
    type = string
    default = ""
}

variable "aws_token" {
    type = string
    default = ""
}

variable "subnet_pub1a" {
  description = "public-subnet-1a"
  default = "subnet-04c0819bd9f93686d"
}

variable "subnet_pub1b" {
  description = "public-subnet-1b"
  default = "subnet-0917cdd517af3d41c"
}
