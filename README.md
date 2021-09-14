## AWS Application Load Balancer Demo Module

This Terraform module adds the nodes of a service to a given AWS application load balancer. This is a simplistic module created for Consul-Terraform-Sync demoing purposes.

## Feature
This module uses the AWS Terraform provider to register an EC2 instance to the given target group of an application load balancer.

## Requirements

### Ecosystem Requirements
| Ecosystem | Version |
|-----------|---------|
| [consul](https://www.consul.io/downloads) | >= 1.7 |
| [consul-terraform-sync](https://www.consul.io/docs/nia) | >= 0.1.0 |
| [terraform](https://www.terraform.io) | >= 0.13 |

### Terraform Providers

| Name | Version |
|------|---------|
| aws | >= 3.56 |

## Setup

1. Create an AWS application load balancer.
1. Create a target group and associate it with the application load balancer.

## Usage

| Input Variable | Required | Description |
|-------------------|----------|-------------|
| alb_target_group_arn | true | The ARN of the target group |

**User Config for Consul Terraform Sync**

example.hcl
```hcl
task {
  name           = "alb-target-group-demo-task"
  description    = "add node to application load balancer target group"
  source         = "mkam/alb-demo/aws"
  version        = "0.1.0"
  providers      = ["aws"]
  services       = ["web", "app"]
  variable_files = ["alb_input.tfvars"]
}

driver "terraform" {
  required_providers = {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.56.0"
    }
  }
}

terraform_provider "aws" {
  region = "us-west-1"
}
```

**Variable file**

Optional input variable file defined by a user for the task above.

alb_input.tfvars
```hcl
alb_target_group_arn = "arn:aws:elasticloadbalancing:us-west-1:123456:targetgroup/my-target-group/abc123"
```
