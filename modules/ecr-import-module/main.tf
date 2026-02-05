resource "aws_ecr_repository" "this" {
  name                 = var.repo_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = merge(
    var.mylo1_tags,
    { Name = var.repo_name }
  )
}
