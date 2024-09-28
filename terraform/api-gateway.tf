resource "aws_apigatewayv2_api" "main_api" {
    name = "main-api"
    description = "API Gateway para acesso aos recurso da aplicação no EKS."
    protocol_type = "HTTP"
}

resource "aws_apigatewayv2_vpc_link" "main_vpc_link" {
    name = "main-vpc-link"
    subnet_ids = aws_subnet.private_subnet[*].id
    security_group_ids = [aws_security_group.lb_sg.id]
}

resource "aws_apigatewayv2_integration" "lb_integration" {
  api_id = aws_apigatewayv2_api.main_api.id
  integration_type = "HTTP_PROXY"
  integration_uri = aws_lb_listener.http.arn
  integration_method = "ANY"
  connection_id = aws_apigatewayv2_vpc_link.main_vpc_link.id
  connection_type = "VPC_LINK"
  request_parameters = {
    "overwrite:path" = "/"
  }
}

resource "aws_apigatewayv2_route" "proxy" {
    api_id = aws_apigatewayv2_api.main_api.id
    route_key = "ANY /{proxy+}"
    target = "integrations/${aws_apigatewayv2_integration.lb_integration.id}"
}

resource "aws_apigatewayv2_stage" "default_stage" {
  api_id = aws_apigatewayv2_api.main_api.id
  name = "$default"
  auto_deploy = true
}




