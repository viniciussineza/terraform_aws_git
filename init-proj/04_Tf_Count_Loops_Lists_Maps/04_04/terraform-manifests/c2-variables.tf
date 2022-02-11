variable "aws_region" {
  description = "Region in which AWS resources are going to be created"
  type        = string
  default     = "us-west-2"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = map(string)
  default     = {
    "dev" = "t2.micro"
  }
}

variable "instance_keypair" {
  description = "EC2 key pair that will be associated to a instance"
  type        = string
  default     = "terraform-key"
}