resource "aws_eks_cluster" "tech-challenge-cluster" {
  name     = "tech-challenge-monolith"
  role_arn = "arn:aws:iam::902493024723:role/LabRole"

  vpc_config {
    subnet_ids         = ["public_subnet", "private_subnet"]
    security_group_ids = [aws_security_group.eks_sg.id]
  }
}
