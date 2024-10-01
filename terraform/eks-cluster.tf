resource "aws_eks_cluster" "tech_challenge_cluster" {  
  name     = "tech-challenge-monolith"
  role_arn =  var.aws_iam_labrole_arn 

  vpc_config {
    subnet_ids = aws_subnet.private_subnet[*].id
    security_group_ids = [aws_security_group.eks_sg.id]
  }

  depends_on = [ 
    aws_subnet.private_subnet, 
    aws_security_group.eks_sg
  ]
}

resource "aws_eks_node_group" "main_nodes" {
  cluster_name    = aws_eks_cluster.tech_challenge_cluster.name
  node_group_name = "main-node-group"
  node_role_arn   = var.aws_iam_labrole_arn
  subnet_ids      = aws_subnet.private_subnet[*].id

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  instance_types = ["t2.micro"]
  disk_size      = 20

  tags = {
    Name = "main-node-group"
  }

  depends_on = [ 
    aws_eks_cluster.tech_challenge_cluster,
    aws_subnet.private_subnet
  ]
}