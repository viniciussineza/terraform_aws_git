resource "aws_security_group" "vpc-ssh" {
  name        = "vpc-ssh"
  description = "Dev VPC SSH"

  ingress {
    description = "Allow port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["189.121.115.0/24"]
  }

  egress {
    description = "Allows all IPs and ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SSH access"
  }
}

resource "aws_security_group" "vpc-web" {
  name        = "vpc-web"
  description = "Dev VPC WEB"

  ingress {
    description = "Allow port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["189.121.115.0/24"]
  }

  ingress {
    description = "Allow port 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["189.121.115.0/24"]
  }

  egress {
    description = "Allow all IPs and ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web access"
  }
}