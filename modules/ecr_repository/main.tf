resource "aws_ecr_repository" "backend-auth" {
  name                 = var.name
  image_tag_mutability = "MUTABLE"
}