resource "aws_lb_target_group" "main_tg" {
    name = "main-target-group"
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.main_vpc.id

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