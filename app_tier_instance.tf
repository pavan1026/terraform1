resource "aws_instance" "web" {
  ami                         = "ami-0f3d9639a5674d559"
  instance_type               = "t2.micro"
  key_name                    = "eu-west"
  monitoring                  = true
  vpc_security_group_ids      = ["${aws_security_group.sg.id}"]
  subnet_id                   = aws_subnet.private_subnet.id
  private_ip                  = "10.0.1.11"
  associate_public_ip_address = false
  tags = {
    Name = "pri-web2"
  }

user_data = <<-EOF
#!/bin/bash
yum update -y
sudo amazon-linux-extras install epel -y
sudo yum update -y
sudo amazon-linux-extras install -y php7.2
sudo yum install httpd -y
service start httpd
yum install git -y
sudo apt install mysql-client-core-8.0
EOF
}

