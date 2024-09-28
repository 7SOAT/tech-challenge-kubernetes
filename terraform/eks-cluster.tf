resource "aws_eks_cluster" "tech_challenge_cluster" {  
  name     = "tech-challenge-monolith"
  role_arn =  var.aws_iam_labrole_arn 

  vpc_config {
    subnet_ids         = aws_subnet.private_subnet[*].id
    security_group_ids = [aws_security_group.eks_sg.id]
  }
}

resource "aws_launch_template" "main_eks_nodes" {
  name_prefix = "eks-node-"
  image_id = data.aws_ami.eks_worker.id
  instance_type = "t2.micro"

  network_interfaces {
    security_groups = [aws_security_group.eks_sg.id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "eks-node"
    }
  }
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

  launch_template {
    id = aws_launch_template.main_eks_nodes.id
    version = "$Latest"
  }

  tags = {
    Name = "main-node-group"
  }
}