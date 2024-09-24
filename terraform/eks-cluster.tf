resource "aws_eks_cluster" "tech-challenge-cluster" {  
  name     = "tech-challenge-monolith"
  role_arn =  var.aws_iam_labrole_arn
   
   

  vpc_config {
    subnet_ids         = aws_subnet.private_subnet[*].id
    security_group_ids = [aws_security_group.eks_sg.id]
  }
}
