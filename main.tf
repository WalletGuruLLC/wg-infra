# module "key_pair" {
#   source     = "./modules/key_pair"
#   key_name   = "local-key"
#   public_key = var.public_key
# }
#
# module "net" {
#   source = "./modules/network_ec2"
#   name   = "local-network"
#   incoming_ports = [
#     {
#       from     = 22
#       to       = 22
#       protocol = "tcp"
#     },
#     {
#       from     = 3030
#       to       = 3030
#       protocol = "tcp"
#     },
#     {
#       from     = 3001
#       to       = 3001
#       protocol = "tcp"
#     },
#     {
#       from     = 3000
#       to       = 3000
#       protocol = "tcp"
#     },
#     {
#       from     = 3003
#       to       = 3003
#       protocol = "tcp"
#     },
#     {
#       from     = 3006
#       to       = 3006
#       protocol = "tcp"
#     },
#     {
#       from     = 3010
#       to       = 3010
#       protocol = "tcp"
#     },
#     {
#       from     = 4433
#       to       = 4433
#       protocol = "tcp"
#     },
#     {
#       from     = 3031
#       to       = 3031
#       protocol = "tcp"
#     },
#     {
#       from     = 4001
#       to       = 4001
#       protocol = "tcp"
#     },
#     {
#       from     = 4000
#       to       = 4000
#       protocol = "tcp"
#     },
#     {
#       from     = 4003
#       to       = 4003
#       protocol = "tcp"
#     },
#     {
#       from     = 4006
#       to       = 4006
#       protocol = "tcp"
#     },
#     {
#       from     = 4010
#       to       = 4010
#       protocol = "tcp"
#     },
#     {
#       from     = 4432
#       to       = 4432
#       protocol = "tcp"
#     },
#     {
#       from     = 4436
#       to       = 4436
#       protocol = "tcp"
#     },
#     {
#       from     = 5432
#       to       = 5432
#       protocol = "tcp"
#     },
#     {
#       from     = 9229
#       to       = 9229
#       protocol = "tcp"
#     },
#     {
#       from     = 9230
#       to       = 9230
#       protocol = "tcp"
#     },
#     {
#       from     = 9231
#       to       = 9231
#       protocol = "tcp"
#     },
#     {
#       from     = 9232
#       to       = 9232
#       protocol = "tcp"
#     },
#     {
#       from     = 4342
#       to       = 4342
#       protocol = "tcp"
#     }
#   ]
#   outgoing_ports = [
#     {
#       from     = 0
#       to       = 0
#       protocol = "-1"
#     }
#   ]
# }
#
# module "rafiki_ec2" {
#   source                 = "./modules/ec2"
#   name                   = "rafiki-ec2"
#   key_name               = "local-key"
#   subnet_id              = module.net.subnet_id
#   vpc_security_group_ids = module.net.vpc_security_group_ids
#   volume_size            = 40
#   init_script            = "scripts/rafiki.sh"
# }

#### kubernetes module

data "aws_availability_zones" "available" {}

locals {
  cluster_name = "eks-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.12.1"

  name = "vpc"

  cidr = "10.0.0.0/16"
  azs = slice(data.aws_availability_zones.available.names, 0, 3)

  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = 1
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.23.0"

  cluster_name    = local.cluster_name
  cluster_version = "1.31"

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  cluster_endpoint_public_access = true

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"

  }

  eks_managed_node_groups = {
    one = {
      name = "node-group-1"

      instance_types = ["t3.large"]

      min_size     = 1
      max_size     = var.namespaces[0] == "dev" || var.namespaces[0] == "qa" ? 3 : 4
      desired_size = var.namespaces[0] == "dev" || var.namespaces[0] == "qa" ? 3 : 3
    }
  }
}

#### kubernetes module

#### repos images docker

module "repositories" {
  source = "./modules/ecr_repository"
  for_each = toset(var.repos_list)
  name   = each.key
}
#### repos images docker

#### create namespaces k8s

resource "kubernetes_namespace" "resources_name" {
  depends_on = [module.eks]
  for_each = toset(keys({for i, r in var.namespaces :  i => r}))
  metadata {
    name = var.namespaces[each.value]
  }
}
#### create namespaces k8s

### renew ecr credentials

module "ecr_credentials" {
  depends_on = [module.eks]
  source         = "./modules/ecr_credentials"
  for_each       = {for i, r in var.namespaces :  i => r}
  namespace      = each.value
  name_secret    = "docker-cfg"
  aws_access_key = var.aws_access_key
  aws_region     = var.aws_region
  aws_secret_key = var.aws_secret_key
  aws_account_id = var.aws_account_id
}

#### renew ecr credentials

#### microservices

module "microservices" {
  depends_on = [module.eks, kubernetes_namespace.resources_name]
  source           = "./modules/microservices"
  for_each         = {for each in var.microservices_list : each.name => each}
  name             = each.value.name
  namespace        = each.value.namespace
  port             = each.value.port
  replicas         = each.value.replicas
  var_envs         = each.value.var_envs
  type_port        = each.value.type_port
  node_port        = each.value.node_port
  image            = each.value.image
  commands         = each.value.commands
  commands_job     = each.value.commands_job
  var_envs_job     = each.value.var_envs_job
  apply_migrations = each.value.apply_migrations
}

#### microservices


#### traefik
module "traefik" {
  depends_on = [module.eks]
  source      = "aigisuk/traefik/kubernetes"
  version     = "0.2.1"
  values_file = "traefik-values.yaml"
}

resource "kubernetes_service_v1" "traefik-dashboard" {
  depends_on = [module.traefik]
  metadata {
    name      = "traefik-dashboard"
    namespace = "traefik"
  }
  spec {
    selector = {
      "app.kubernetes.io/name" = "traefik"
    }
    port {
      name        = "web"
      port        = 9000
      target_port = 9000
    }
  }
}

module "traefik-ingress" {
  depends_on = [module.traefik]
  source       = "./modules/traefik"
  for_each     = {for each in var.traefik_envs : each.domain => each}
  domain       = each.value.domain
  namespace    = each.value.namespace
  service_name = each.value.service_name
  service_port = each.value.service_port
  traefik_name = each.value.traefik_name
}

#### traefik

#### Domain

resource "aws_route53_zone" "walletguru" {
  count    = var.create_domain ? 1 : 0
  provider = aws.shared
  name     = "walletguru.co"
}

module "records" {
  source   = "./modules/route53"
  for_each = {for each in var.records_list : each.name => each}
  zone_id  = each.value.zone_id_shared != "" ? each.value.zone_id_shared : var.create_domain ? aws_route53_zone.walletguru[0].zone_id : var.zone_id
  name     = each.value.name
  type     = each.value.type
  records  = each.value.records
  providers = {
    aws = aws.shared
  }
}

#### Domain

#### COGNITO
module "cognito" {
  source                         = "./modules/cognito"
  name                           = "user-auth"
  username_attributes = ["email"]
  deletion_protection            = "ACTIVE"
  generate_secret                = true
  refresh_token_validity         = 30
  auth_session_validity          = 3
  access_token_validity          = 120
  id_token_validity              = 60
  email_configuration_source_arn = var.email_configuration_source_arn
}
#### COGNITO

#### DYNAMO TABLE
module "dynamo_table" {
  source                      = "./modules/dynamo_table"
  for_each                    = {for each in var.dynamo_tables : each.name => each}
  name                        = each.value.name
  billing_mode                = each.value.billing_mode
  read_capacity               = each.value.read_capacity
  write_capacity              = each.value.write_capacity
  hash_key                    = each.value.hash_key
  range_key                   = each.value.range_key
  deletion_protection_enabled = each.value.deletion_protection_enabled
  attributes                  = each.value.attributes
  ttl                         = each.value.ttl
  global_secondary_index      = each.value.global_secondary_index
  tags                        = each.value.tags
}
#### DYNAMO TABLE

#### SQS
resource "aws_sqs_queue" "queue_notifications" {
  name                      = var.name_queue
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 60
  receive_wait_time_seconds = 0
  tags = {}
}
#### SQS

#### S3
module "s3" {
  source      = "./modules/s3"
  for_each    = {for each in var.s3_buckets : each.name => each}
  bucket_name = each.value.name
}

# module "s3-deep-link" {
#   source      = "./modules/s3"
#   count = var.create_s3_deep_link ? 1 : 0
#   bucket_name = "wg-deep-link"
# }


resource "aws_subnet" "vpn" {
  vpc_id     = module.vpc.vpc_id
  cidr_block = "10.0.8.0/22"
  tags = {
    Name = "VPN subnet for client connections"
  }
}

module "vpn-client" {
  depends_on = [aws_subnet.vpn]
  source                = "babicamir/vpn-client/aws"
  version               = "1.0.1"
  organization_name     = "wallet guru"
  project-name          = "wg"
  environment = var.namespaces[0]
  # Network information
  vpc_id                = module.vpc.vpc_id
  subnet_id             = aws_subnet.vpn.id
  client_cidr_block     = "10.0.0.0/22" # It must be different from the primary VPC CIDR
  # VPN config options
  split_tunnel = "true" # or false
  vpn_inactive_period = "300" # seconds
  session_timeout_hours = "8"
  logs_retention_in_days = "7"
  # List of users to be created
  aws-vpn-client-list = ["root", "terraform", "daniel.gomez"] #Do not delete "root" user!
}