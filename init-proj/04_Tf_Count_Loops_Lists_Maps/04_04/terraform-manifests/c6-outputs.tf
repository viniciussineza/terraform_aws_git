# EC2 instance public IP and DNS with toset
output "instance_public_ip_toset" {
  description = "Instance public IP"
  #value = "aws_instance.vm-data.*.public_ip"  #legacy
  #value = "aws_instance.vm-data[*].public_ip" #latest
  value = toset([for instance in aws_instance.vm-data: instance.public_ip])
}

output "instance_public_dns" {
  description = "Instance public DNS"
  #value = "aws_instance.vm-data.*.public_dns"  #legacy
  #value = "aws_instance.vm-data[*].public_dns" #latest
  value = toset([for instance in aws_instance.vm-data: instance.public_dns])
}

# EC2 instance public DNS with tomap
output "instance_public_ip_tomap" {
  description = "Instance public DNS with tomap"
  value = tomap({for az, instance in aws_instance.vm-data: az => instance.public_dns})
}