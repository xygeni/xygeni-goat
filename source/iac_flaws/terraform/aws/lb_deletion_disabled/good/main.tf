# pass

resource "aws_lb" "enabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  enable_deletion_protection = true
}

resource "aws_alb" "enabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  enable_deletion_protection = true
}
