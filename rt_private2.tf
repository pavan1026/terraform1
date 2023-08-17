resource "aws_route_table" "private_route_table1" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "private_route2"
  }
}

resource "aws_route_table_association" "private_subnet_association1" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.private_route_table1.id
}

