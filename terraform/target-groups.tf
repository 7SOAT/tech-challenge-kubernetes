resource "aws_lb_target_group" "main_tg" {
    name = "main-target-group"
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.main_vpc.id
    target_type = "ip"

    health_check {
      path = "/health"
      interval = 30
      timeout = 5
      healthy_threshold = 2
      unhealthy_threshold = 2
    }

    tags = {
        Name = "main-target-group"
    }
}

resource "aws_lb_target_group_attachment" "main_eks_targets" {
  count = length(data.aws_instances.main_eks_nodes.private_ips)
  target_group_arn = aws_lb_target_group.main_tg.arn
  target_id = data.aws_instances.main_eks_nodes.private_ips[count.index]
  port = 80
}