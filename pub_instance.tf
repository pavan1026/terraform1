resource "aws_instance" "nginx" {
  ami                         = "ami-0f3d9639a5674d559"
  instance_type               = "t2.micro"
  key_name                    = "eu-west"
  monitoring                  = true
  vpc_security_group_ids      = ["${aws_security_group.sg.id}"]
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  tags = {
    Name = "pub-nginx"
  }
user_data = <<-EOF
#!/bin/bash
yum update -y
sudo amazon-linux-extras install epel -y
yum update -y
yum install wget -y
yum install nginx -y
yum install git -y
service nginx start
EOF
}

