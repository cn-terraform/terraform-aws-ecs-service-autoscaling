module "cluster" {
  source = "cn-terraform/ecs-cluster/aws"
  name   = "test-cluster"
}

module "base-network" {
  source     = "cn-terraform/networking/aws"
  cidr_block = "192.168.0.0/16"

  vpc_additional_tags = {
    vpc_tag1 = "tag1",
    vpc_tag2 = "tag2",
  }

  public_subnets = {
    first_public_subnet = {
      availability_zone = "us-east-1a"
      cidr_block        = "192.168.0.0/19"
    }
    second_public_subnet = {
      availability_zone = "us-east-1b"
      cidr_block        = "192.168.32.0/19"
    }
  }

  public_subnets_additional_tags = {
    public_subnet_tag1 = "tag1",
    public_subnet_tag2 = "tag2",
  }

  private_subnets = {
    first_private_subnet = {
      availability_zone = "us-east-1a"
      cidr_block        = "192.168.128.0/19"
    }
    second_private_subnet = {
      availability_zone = "us-east-1b"
      cidr_block        = "192.168.160.0/19"
    }
  }

  private_subnets_additional_tags = {
    private_subnet_tag1 = "tag1",
    private_subnet_tag2 = "tag2",
  }
}

module "td" {
  source          = "cn-terraform/ecs-fargate-task-definition/aws"
  name_prefix     = "test-td"
  container_image = "ubuntu"
  container_name  = "test"
}

module "service" {
  source              = "cn-terraform/ecs-fargate-service/aws"
  name_prefix         = "test-service"
  vpc_id              = module.base-network.vpc_id
  ecs_cluster_arn     = module.cluster.aws_ecs_cluster_cluster_arn
  task_definition_arn = module.td.aws_ecs_task_definition_td_arn
  public_subnets      = module.base-network.public_subnets
  private_subnets     = module.base-network.private_subnets
  container_name      = "test"
  enable_autoscaling  = false
}

module "ecs-service-autoscaling" {
  source           = "../../"
  name_prefix      = "test-as"
  ecs_cluster_name = module.cluster.aws_ecs_cluster_cluster_name
  ecs_service_name = module.service.aws_ecs_service_service_name
  # region                                      = "us-east-1"
  # availability_zones                          = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"]
  # vpc_cidr_block                              = "192.168.0.0/16"
  # public_subnets_cidrs_per_availability_zone  = ["192.168.0.0/19", "192.168.32.0/19", "192.168.64.0/19", "192.168.96.0/19"]
  # private_subnets_cidrs_per_availability_zone = ["192.168.128.0/19", "192.168.160.0/19", "192.168.192.0/19", "192.168.224.0/19"]
}
