# EC2 instance
resource "aws_instance" "vm-data" {
  ami = data.aws_ami.amilinux2.id
  instance_type = var.instance_type["dev"]
  user_data = file("${path.module}/app1-install.sh")
  key_name = var.instance_keypair
  vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id ]
  for_each = toset(keys({for i, d in data.aws_ec2_instance_type_offerings.type-sup:
    i => d.instance_types if length(d.instance_types) != 0}))
  availability_zone = each.key
  tags = {
    "Name" = "For-Demo-${each.value}"
  }
}