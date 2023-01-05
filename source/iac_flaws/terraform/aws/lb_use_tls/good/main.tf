# pass

resource "aws_lb_listener" "http_redirect" {
  load_balancer_arn = var.aws_lb_arn
  protocol          = "HTTP"
  port              = "80"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "tcp" {
  load_balancer_arn = var.aws_lb_arn
  protocol          = "TCP"
  port              = "8080"

  default_action {
    type             = "forward"
    target_group_arn = var.aws_lb_target_group_arn
  }
}

resource "aws_lb_listener" "udp" {
  load_balancer_arn = var.aws_lb_arn
  protocol          = "UDP"
  port              = "8080"

  default_action {
    type             = "forward"
    target_group_arn = var.aws_lb_target_group_arn
  }
}

resource "aws_lb_listener" "tcp_udp" {
  load_balancer_arn = var.aws_lb_arn
  protocol          = "TCP_UDP"
  port              = "8080"

  default_action {
    type             = "forward"
    target_group_arn = var.aws_lb_target_group_arn
  }
}

resource "aws_lb_listener" "tls_fs_1_2" {
  load_balancer_arn = var.aws_lb_arn
  protocol          = "TLS"
  port              = "8080"
  ssl_policy        = "ELBSecurityPolicy-FS-1-2-Res-2019-08"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = var.aws_lb_target_group_arn
  }
}

resource "aws_lb_listener" "https_fs_1_2" {
  load_balancer_arn = var.aws_lb_arn
  protocol          = "HTTPS"
  port              = "443"
  ssl_policy        = "ELBSecurityPolicy-FS-1-2-Res-2019-08"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = var.aws_lb_target_group_arn
  }
}

resource "aws_alb_listener" "https_tls_1_2" {
  load_balancer_arn = var.aws_lb_arn
  protocol          = "HTTPS"
  port              = "443"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-Res-2019-08"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = var.aws_lb_target_group_arn
  }
}