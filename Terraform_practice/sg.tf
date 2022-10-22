resource "aws_security_group" "vpc-web-ssh" {
  name        = "vpc-web-ssh"
  description = "Allow ssh and web traffic"
  #vpc_id      = aws_vpc.main.id

  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content{
     from_port   = port.value
     to_port     = port.value
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
    } 
  }

  /*
  ingress {
    description = "Allow http traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow https traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  */

  dynamic "egress" {
    iterator = port
    for_each = var.egressrules
    content{
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "allow_tls"
  }
}
