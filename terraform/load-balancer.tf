resource "aws_lb" "alb" {
  name               = "ScalableWebApp-ALB"
  internal           = false
  load_balancer_type = "application"

  security_groups = [aws_security_group.website_sg.id]

  subnets = [
    aws_subnet.public_a.id,
    aws_subnet.public_b.id
  ]

  tags = {
    Name = "ScalableWebApp-ALB"
  }
}

resource "aws_lb_target_group" "red" {
  name     = "Red"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path = "/red/index.html"
  }
}

resource "aws_lb_target_group" "blue" {
  name     = "Blue"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path = "/blue/index.html"
  }
}

resource "aws_lb_target_group_attachment" "red" {
  target_group_arn = aws_lb_target_group.red.arn
  target_id        = aws_instance.red.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "blue" {
  target_group_arn = aws_lb_target_group.blue.arn
  target_id        = aws_instance.blue.id
  port             = 80
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.red.arn
  }
}

resource "aws_lb_listener_rule" "red" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 1

  condition {
    host_header {
      values = ["red.fathiaiyyoub.com.au"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.red.arn
  }
}

resource "aws_lb_listener_rule" "blue" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 2

  condition {
    host_header {
      values = ["blue.fathiaiyyoub.com.au"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.blue.arn
  }
}