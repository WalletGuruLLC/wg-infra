output "ip_instance" {
  value = aws_instance.terraform_ec2.public_ip
}