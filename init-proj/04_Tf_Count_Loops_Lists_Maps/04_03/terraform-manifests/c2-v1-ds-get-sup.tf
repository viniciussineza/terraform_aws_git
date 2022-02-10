# Datasource
data "aws_ec2_instance_type_offerings" "type-sup1" {
  filter {
    name   = "instance-type"
    values = ["t2.micro"]
  }
  filter {
    name   = "location"
    values = ["us-west-2a"]
    #values = ["us-west-2e"]
  }
  
  location_type = "availability-zone"
}

# Outuput
output "sup_return" {
  value = data.aws_ec2_instance_type_offerings.type-sup1.instance_types
}