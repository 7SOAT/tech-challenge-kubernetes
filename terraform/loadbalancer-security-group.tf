variable "vpc_id" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}
resource "aws_security_group" "lb_sg" {
      name        = "loadbalancer-sg"
      description = "Security Group for Load Balancer"
      vpc_id = aws_vpc.main-vpc.id

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
    }
