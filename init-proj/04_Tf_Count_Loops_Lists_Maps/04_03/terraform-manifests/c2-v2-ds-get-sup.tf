# Datasource
data "aws_ec2_instance_type_offerings" "type-sup2" {
  for_each = toset([ "us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d"])
  filter {
    name   = "instance-type"
    values = ["t2.micro"]
  }
  filter {
    name   = "location"
    values = [each.key]
  }

  location_type = "availability-zone"
}

# Output
output "sup_return_v2" {
  #value = data.aws_ec2_instance_type_offerings.type-sup.instance_types
  value = toset([for i in data.aws_ec2_instance_type_offerings.type-sup2: i.instance_types])
}

# Output 2

output "sup_return_v2_1" {
  value = {
    for i, d in data.aws_ec2_instance_type_offerings.type-sup2: i => d.instance_types
  }
}