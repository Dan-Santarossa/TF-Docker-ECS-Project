resource "aws_subnet" "ecs_subnet1" {
  vpc_id                  = aws_vpc.ecs_tf_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "ecs_subnet2" {
  vpc_id                  = aws_vpc.ecs_tf_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
}
