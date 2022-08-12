resource "aws_vpc" "ecs_tf_vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = "ecs_tf_vpc"
  }
}
