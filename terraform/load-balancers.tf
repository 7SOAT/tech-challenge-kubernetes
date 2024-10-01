# resource "aws_lb" "main_alb" {
#     name = "main-alb"
#     internal = true
#     load_balancer_type = "application"
#     security_groups = [aws_security_group.alb_sg.id]
#     subnets = aws_subnet.private_subnet[*].id

#     enable_deletion_protection = false

#     tags = {
#         Name = "main-alb"
#     }

#     depends_on = [ 
#         aws_security_group.alb_sg,
#         aws_subnet.private_subnet
#     ]
# }

# resource "aws_lb_listener" "http" {
#     load_balancer_arn = aws_lb.main_alb.arn
#     port = 80
#     protocol = "HTTP"

#     default_action {
#       type = "forward"
#       target_group_arn = aws_lb_target_group.main_tg.arn
#     }

#     depends_on = [ 
#         aws_lb_target_group.main_tg 
#     ]
# }

resource "aws_lb" "nlb" {
    name = "tech-challenge-nlb"
    internal = true
    load_balancer_type = "network"
    subnets = aws_subnet.private_subnet[*].id
    security_groups = [aws_security_group.nlb_sg.id]

    enable_deletion_protection = false

    tags = {
        Name = "Network Load Balancer"
    }

    depends_on = [ 
        aws_subnet.private_subnet, 
        aws_lb_target_group.main_tg 
    ]
}

resource "aws_lb_listener" "nlb_listener" {
  load_balancer_arn = aws_lb.nlb.arn
  port = 80
  protocol = "TCP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.main_tg.arn
  }
}