resource "aws_instance" "terraform-instance" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public_subnet_1.id
  key_name               = var.PUB_KEY
  vpc_security_group_ids = [aws_security_group.terrafrom_sg.id]
  count = 2
  tags = {
    Name = "Terraform_Instance"
  }
}

output "PublicIP1" {
  value = aws_instance.terraform-instance[0].public_ip
}

output "PublicIP2" {
  value = aws_instance.terraform-instance[1].public_ip
}