resource "aws_instance" "myec2" {
  ami                   = var.ami-id
  instance_type         = var.type_of_instance
  user_data             = file("${path.module}/script1.sh")
  vpc_security_group_ids = [aws_security_group.allow-tls.id]
  tags = {
    "Name" = "ec2-demo"
  }
}
