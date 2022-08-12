resource "aws_ecs_cluster" "ecs-cluster" {
  name = "ecs-cluster-project"
}
resource "aws_ecs_cluster_capacity_providers" "ecs-cap-provider" {
  cluster_name = aws_ecs_cluster.ecs-cluster.id

  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = "FARGATE"
  }
}

module "ecs-fargate" {
  source  = "umotif-public/ecs-fargate/aws"
  version = "~> 6.1.0"

  name_prefix        = "ecs-fargate-project"
  vpc_id             = aws_vpc.ecs_tf_vpc.id
  private_subnet_ids = [aws_subnet.ecs_subnet1.id, aws_subnet.ecs_subnet2.id]

  cluster_id = aws_ecs_cluster.ecs-cluster.id

  task_container_image   = var.image
  task_definition_cpu    = 256
  task_definition_memory = 512

  task_container_port             = 80
  task_container_assign_public_ip = true

  load_balanced = false

  target_groups = [
    {
      target_group_name = "fargate-group"
      container_port    = 80
    }
  ]

  health_check = {
    port = "traffic-port"
    path = "/"
  }
}
