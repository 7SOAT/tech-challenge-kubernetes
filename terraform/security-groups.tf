resource "aws_security_group" "eks_sg" {
  name        = "eks-cluster-sg"
  description = "Security Group for EKS Cluster"
  vpc_id      = ["10.0.1.0/24", "10.0.2.0/24"]

  # Allow inbound traffic from the load balancer to the worker nodes
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
