# AWS region
variable "aws_region" {
  description = "Region in which AWS resources are going to be created"
  type        = string
  default     = "us-west-2"
}

# EC2 instance type
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

# EC2 instance key pair
variable "instance_keypair" {
  description = "EC2 key pair that will be associated to a instance"
  type        = string
  default     = "terraform-key"
}

# EC2 instance type List
variable "instance_type_list" {
  description = "List demonstration"
  type        = list(string)
  default     = ["t2.micro", "t2.micro"]
}

# EC2 instance type map

variable "instance_type_map" {
  description = "Map demonstration"
  type        = map(string)
  default     = {
    "dev"  = "t2.micro"
    "qa"   = "t2.micro"
    "prod" = "t2.micro"
  }
}