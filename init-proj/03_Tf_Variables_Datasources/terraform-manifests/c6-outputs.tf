# Terraform outputs values
# EC2 instance public IP
output "instance_PublicIP" {
  description = "EC2 instance public IP"
  value = aws_instance.vm-data.public_ip
}

# EC2 instance public DNS
output "instance_PublicDNS" {
  description = "EC2 instance public DNS"
  value = aws_instance.vm-data.public_dns
}