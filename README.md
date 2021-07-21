# AWS ECS Service Autoscaling Module #

This Terraform module deploys autoscaling alarms for an AWS ECS Fargate service.

[![](https://github.com/cn-terraform/terraform-aws-ecs-service-autoscaling/workflows/terraform/badge.svg)](https://github.com/cn-terraform/terraform-aws-ecs-service-autoscaling/actions?query=workflow%3Aterraform)
[![](https://img.shields.io/github/license/cn-terraform/terraform-aws-ecs-service-autoscaling)](https://github.com/cn-terraform/terraform-aws-ecs-service-autoscaling)
[![](https://img.shields.io/github/issues/cn-terraform/terraform-aws-ecs-service-autoscaling)](https://github.com/cn-terraform/terraform-aws-ecs-service-autoscaling)
[![](https://img.shields.io/github/issues-closed/cn-terraform/terraform-aws-ecs-service-autoscaling)](https://github.com/cn-terraform/terraform-aws-ecs-service-autoscaling)
[![](https://img.shields.io/github/languages/code-size/cn-terraform/terraform-aws-ecs-service-autoscaling)](https://github.com/cn-terraform/terraform-aws-ecs-service-autoscaling)
[![](https://img.shields.io/github/repo-size/cn-terraform/terraform-aws-ecs-service-autoscaling)](https://github.com/cn-terraform/terraform-aws-ecs-service-autoscaling)

## Usage

Check valid versions on:
* Github Releases: <https://github.com/cn-terraform/terraform-aws-ecs-service-autoscaling/releases>
* Terraform Module Registry: <https://registry.terraform.io/modules/cn-terraform/ecs-service-autoscaling/aws>

## Other modules that you may need to use this module

The Networking module:
* Github Releases: <https://github.com/cn-terraform/terraform-aws-networking/releases>
* Terraform Module Registry: <https://registry.terraform.io/modules/cn-terraform/networking/aws>

The ECS cluster module:
* Github Releases: <https://github.com/cn-terraform/terraform-aws-ecs-cluster/releases>
* Terraform Module Registry: <https://registry.terraform.io/modules/cn-terraform/ecs-cluster/aws>

The ECS Task Definition:
* Github Releases: <https://github.com/cn-terraform/terraform-aws-ecs-fargate-task-definition/releases>
* Terraform Module Registry: <https://registry.terraform.io/modules/cn-terraform/ecs-fargate-task-definition/aws>

The ECS Service module:
* Github Releases: <https://github.com/cn-terraform/terraform-aws-ecs-fargate-service/releases>
* Terraform Module Registry: <https://registry.terraform.io/modules/cn-terraform/ecs-fargate-service>

## Install pre commit hooks.

Pleas run this command right after cloning the repository.

        pre-commit install

For that you may need to install the folowwing tools:
* [Pre-commit](https://pre-commit.com/) 
* [Terraform Docs](https://terraform-docs.io/)

In order to run all checks at any point run the following command:

        pre-commit run --all-files

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_appautoscaling_policy.scale_down_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.scale_up_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_target.scale_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) | resource |
| [aws_cloudwatch_metric_alarm.cpu_high](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.cpu_low](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ecs_cluster_name"></a> [ecs\_cluster\_name](#input\_ecs\_cluster\_name) | Name of the ECS cluster | `any` | n/a | yes |
| <a name="input_ecs_service_name"></a> [ecs\_service\_name](#input\_ecs\_service\_name) | Name of the ECS service | `any` | n/a | yes |
| <a name="input_max_cpu_evaluation_period"></a> [max\_cpu\_evaluation\_period](#input\_max\_cpu\_evaluation\_period) | The number of periods over which data is compared to the specified threshold for max cpu metric alarm | `string` | `"3"` | no |
| <a name="input_max_cpu_period"></a> [max\_cpu\_period](#input\_max\_cpu\_period) | The period in seconds over which the specified statistic is applied for max cpu metric alarm | `string` | `"60"` | no |
| <a name="input_max_cpu_threshold"></a> [max\_cpu\_threshold](#input\_max\_cpu\_threshold) | Threshold for max CPU usage | `string` | `"85"` | no |
| <a name="input_min_cpu_evaluation_period"></a> [min\_cpu\_evaluation\_period](#input\_min\_cpu\_evaluation\_period) | The number of periods over which data is compared to the specified threshold for min cpu metric alarm | `string` | `"3"` | no |
| <a name="input_min_cpu_period"></a> [min\_cpu\_period](#input\_min\_cpu\_period) | The period in seconds over which the specified statistic is applied for min cpu metric alarm | `string` | `"60"` | no |
| <a name="input_min_cpu_threshold"></a> [min\_cpu\_threshold](#input\_min\_cpu\_threshold) | Threshold for min CPU usage | `string` | `"10"` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Name prefix for resources on AWS | `any` | n/a | yes |
| <a name="input_scale_target_max_capacity"></a> [scale\_target\_max\_capacity](#input\_scale\_target\_max\_capacity) | The max capacity of the scalable target | `number` | `5` | no |
| <a name="input_scale_target_min_capacity"></a> [scale\_target\_min\_capacity](#input\_scale\_target\_min\_capacity) | The min capacity of the scalable target | `number` | `1` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource tags | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
