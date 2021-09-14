terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=3.56"
		}
	}
}

resource "aws_lb_target_group_attachment" "alb" {
	for_each         = var.services
	target_group_arn = var.alb_target_group_arn
  target_id        = each.value.node
  port             = 8080
}
