# output - for loops List
output "for_list" {
  description = "For loop with list"
  value = [for instance in aws_instance.vm-data: instance.public_dns]
}

# output - for loops Map
output "for_map" {
  description = "For loop with Map"
  value = {for instance in aws_instance.vm-data: instance.id => instance.public_dns}
}

# output - for Loops Map advanced
output "for_map_advance" {
  description = "For loop with Map - advanced"
  value = {for i, instance in aws_instance.vm-data: i => instance.public_dns}
}

# output legacy splat
# output "legacy_splat_instance" {
#   description = "Legacy splat operator"
#   value = aws_instance.vm-data.*.public_dns
# }

# output generalized legacy
output "generalized_splat" {
  description = "Generalized latest splat operator"
  value = aws_instance.vm-data[*].public_dns
}