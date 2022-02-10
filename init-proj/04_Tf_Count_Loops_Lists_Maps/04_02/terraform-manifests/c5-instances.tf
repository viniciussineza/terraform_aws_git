# availability zones
data "aws_availability_zones" "azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}



resource "aws_instance" "vm-data" {
  ami = data.aws_ami.amilinux2.id
  instance_type = var.instance_type_map["dev"]
  user_data = file("${path.module}/app1-install.sh")
  key_name = var.instace_keypair
  vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id ]
  # Create an instance in all availabili zone of a VPC
  for_each = toset(data.aws_availability_zones.azones.names)
  availability_zone = each.key
  # Using each value. each.key == each.valeu
  tags = {
    "Name" = "for_each-Demo-${each.value}"
  }
}