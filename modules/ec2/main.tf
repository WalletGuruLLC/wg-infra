

resource "aws_instance" "terraform_ec2" {
  ami = var.ami-id
  instance_type = var.instance_type
  availability_zone = var.availability_zone
  key_name = var.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.vpc_security_group_ids
  associate_public_ip_address = var.associate_public_ip_address

  root_block_device {
    volume_type = var.volume_type
    volume_size = var.volume_size
  }
  tags = {
    Name = var.name
  }
  user_data = file(var.init_script)


}
