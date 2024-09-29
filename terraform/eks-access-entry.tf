# resource "aws_eks_access_entry" "eks_access_entry" {
#   cluster_name = aws_eks_cluster.tech_challenge_cluster.name
#   principal_arn = var.eks_access_principal_arn
#   kubernetes_groups = [ "tech-challenge" ]
#   type = "STANDARD"
# }