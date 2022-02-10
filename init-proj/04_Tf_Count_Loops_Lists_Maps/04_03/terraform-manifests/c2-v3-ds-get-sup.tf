# Datasource listing availability_zones
data "aws_availability_zones" "azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

# Datasource checking
data "aws_ec2_instance_type_offerings" "type-sup" {
  for_each = toset(data.aws_availability_zones.azones.names)
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

# Output v3_1
output "ret_v3_1" {
  value = {
    for i, d in data.aws_ec2_instance_type_offerings.type-sup: i => d.instance_types
  }
}

# Output v3_2
output "ret_v3_2" {
  value = {
    for i, d in data.aws_ec2_instance_type_offerings.type-sup:
    i => d.instance_types if length(d.instance_types) != 0
  }
}

# Output keys
output "ret_v3_3" {
  value = keys({
    for i, d in data.aws_ec2_instance_type_offerings.type-sup:
    i => d.instance_types if length(d.instance_types) != 0
  })
}

# Output keys and get the first value
output "ret_v3_4" {
  value = keys({
    for i, d in data.aws_ec2_instance_type_offerings.type-sup:
    i => d.instance_types if length(d.instance_types) != 0 })[0]
}
