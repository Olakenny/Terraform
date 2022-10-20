resource "aws_instance" "myec2" {
  ami                    = data.aws_ami.amazonlinux2.id
  instance_type          = var.type_of_instance
  user_data              = file("${path.module}/script1.sh")
  key_name               = var.key_pair
  vpc_security_group_ids = [aws_security_group.vpc-web-ssh.id]
  tags = {
    "Name" = "ec2-demo"
  }
}

# server public ip and dns

output "public-ip" {
  value = aws_instance.myec2.public_ip
  }

output "public-dns" {
  value = aws_instance.myec2.public_dns
  }

