resource "aws_ecs_service" "this" {
  name            = var.service_name
  cluster         = var.cluster_id
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets         = var.subnets
    security_groups = [var.security_group_id]
    assign_public_ip = false
  }
}
