# Terraform setting block
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.21" # Recommended in production
    }
  }
}

# Provider block
provider "aws" {
  profile = "default"
  region = "us-west-2"
}

# Resource block
resource "aws_instance" "ec2_test" {
  ami = "ami-0892d3c7ee96c0bf7" # Ubuntu 20.04 LTS
  instance_type = "t2.micro"
}