output "instance_id" {
  value = aws_instance.name.id
  description = "The ID of the created instance."
}

output "instance_public_ip" {
  value = aws_instance.name.public_ip
  description = "The public IP address of the instance."
}

output "instance_private_ip" {
  value = aws_instance.name.private_ip
  description = "The private IP address of the instance."
}
