output "subnet_id" {
  value = aws_subnet.example_subnet.id
}

output "vpc_security_group_ids" {
  value = [aws_security_group.example_sg.id]
}