# Resource block
resource "aws_instance" "ec2_demo_2" {
    ami = "ami-06cffe063efe892ad" # Amazon linux 2
    instance_type = "t2.micro"
    user_data = file("${path.module}/app1-install.sh")
    tags = {
      "name" = "EC2 Demo"
    }
}