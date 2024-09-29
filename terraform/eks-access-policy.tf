# resource "aws_eks_access_policy_association" "eks_access_policy" {
#   cluster_name = aws_eks_cluster.tech_challenge_cluster.name
#   policy_arn = var.eks_access_policy_arn
#   principal_arn = var.eks_access_principal_arn

#   access_scope {
#     type = "cluster"
#   }
# }