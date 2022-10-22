resource "aws_instance" "myec2" {
  ami = data.aws_ami.amazonlinux2.id
  #instance_type = var.instance_type_string # for string
  instance_type = var.instance_type_list[1] # for list
  #instance_type = var.instance_type_map["qa"] # for map

  user_data              = file("${path.module}/script1.sh")
  key_name               = var.key_pair
  vpc_security_group_ids = [aws_security_group.vpc-web-ssh.id]
  count                  = 2
  tags = {
    "Name" = "stage-${count.index}"
  }
}

# server public ip and dns
/*
output "public-ip" {
  value = aws_instance.myec2[count.index].public_ip
  value = element(concat(aws_instance.public_ip, [""]), 0)
}

output "public-dns" {
  value = concat(aws_instance.myec2[count.index].public_dns)
  value = element(concat(aws_instance.public_dns, [""]), 0)
}

*/