# Create an ALB
resource "aws_lb" "alb" {
  name               = "terraform-ALB"
  internal           = false
  load_balancer_type = "application"

  security_groups = [aws_security_group.alb-security-group.id]
  subnets         = data.aws_subnets.subnets.ids

  enable_deletion_protection = false

  enable_cross_zone_load_balancing = true
  # access_logs {
  #   bucket  = aws_s3_bucket.lb_logs.bucket
  #   prefix  = "test-lb"
  #   enabled = true
  # }

  tags = var.tags
}
# Create target group with one health check
resource "aws_lb_target_group" "http" {
  name        = "terraform-http-lb-TG"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_default_vpc.default.id

  health_check {
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 6
    interval            = 30
    matcher             = "200"
  }

}

# Create a Listener 
resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.http.arn
    type = "forward"
  }
  # default_action {
  #   type = "fixed-response"

  #   fixed_response {
  #     content_type = "text/plain"
  #     message_body = "404: page not found"
  #     status_code  = "404"
  #   }
  # }
  # certificate_arn = aws_acm_certificate_validation.validation.certificate_arn
}

# //TODO Add listener rule



# #  Attach instance(s) to ALB target group - NOT used when using Launch Template
# resource "aws_lb_target_group_attachment" "attachment" {
#   target_group_arn = aws_lb_target_group.http.arn
#   target_id        = aws_lb.alb.arn
#   # port             = 80
# }


output "lb-arn" {
  value = aws_lb.alb.dns_name
}
