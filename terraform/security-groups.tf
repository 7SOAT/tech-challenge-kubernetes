resource "aws_security_group" "eks_sg" {
  name        = "main-eks-cluster-sg"
  description = "Security Group for EKS Cluster"
  vpc_id      = aws_vpc.main_vpc.id

  # Allow inbound traffic from the load balancer to the worker nodes
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"    
    security_groups = [aws_security_group.lb_sg.id]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "main-eks-cluster-sg"
  }
}

resource "aws_security_group" "lb_sg" {
    name        = "main-loadbalancer-sg"
    description = "Security Group for Load Balancer"
    vpc_id = aws_vpc.main_vpc.id

    # Allow inbound HTTP traffic
    ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    # Allow inbound HTTPS traffic
    ingress {
      from_port   = 443
      to_port     = 443
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

    tags = {
      Name = "main-loadbalancer-sg"
    }
  }

  resource "aws_security_group" "rds_sg" {
  name   = "allow-postgres-access"
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Permite acesso público de qualquer lugar. *Tome cuidado com segurança.*
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Permite todo o tráfego de saída
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "RDS Security Group"
  }
}