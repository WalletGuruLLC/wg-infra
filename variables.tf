variable "aws_access_key" {
  type        = string
  description = "AWS Access Key"
}

variable "aws_secret_key" {
  type        = string
  description = "AWS Secret Key"
}

variable "aws_account_id" {
  type        = string
  description = "AWS Account ID"
}

variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "aws_access_key_shared" {
  type        = string
  description = "AWS Access Key"
}

variable "aws_secret_key_shared" {
  type        = string
  description = "AWS Secret Key"
}

variable "aws_region_shared" {
  type        = string
  description = "AWS Region"
}

variable "public_key" {
  type        = string
  description = "Public key"
}

variable "microservices_list" {
  type = list(object({
    name      = string
    namespace = string
    image     = string
    port      = number
    replicas  = number
    node_port = number
    type_port = string
    commands = list(string)
    commands_job = list(string)
    var_envs = list(object({
      name  = string
      value = string
    }))
    var_envs_job = list(object({
      name  = string
      value = string
    }))
    apply_migrations = bool
  }))
  description = "microservices list"
}

variable "namespaces" {
  description = "Namespaces"
  type = list(string)
}

variable "repos_list" {
  description = "Repos list"
  type = list(string)
}


variable "traefik_envs" {
  description = "Envs for traefik"
  type = list(object({
    domain       = string
    namespace    = string
    service_name = string
    service_port = string
    traefik_name = string
  }))
}

variable "records_list" {
  description = "Envs for records"
  type = list(object({
    name = string
    type = string
    records = list(string)
    zone_id_shared = optional(string, "")
  }))
}

variable "dynamo_tables" {
  description = "Dynamo tables"
  type = list(object({
    name                        = string
    billing_mode                = string
    read_capacity               = number
    write_capacity              = number
    hash_key                    = string
    range_key                   = string
    deletion_protection_enabled = bool
    attributes = list(object({
      name = string
      type = string
    }))
    ttl = list(object({
      attribute_name = string
      enabled        = bool
    }))
    global_secondary_index = list(object({
      name            = string
      hash_key        = string
      range_key       = string
      write_capacity  = number
      read_capacity   = number
      projection_type = string
      non_key_attributes = list(string)
    }))
    tags = map(string)

  }))
}

variable "name_queue" {
  description = "Name of the queue"
  type        = string
}

variable "s3_buckets" {
  description = "S3 buckets"
  type = list(object({
    name = string
  }))
}

variable "create_domain" {
  description = "Create domain"
  type        = bool
}

variable "zone_id" {
  description = "Zone id"
  type        = string
}


variable "email_configuration_source_arn" {
  description = "Email configuration source arn"
  type        = string
}

variable "create_s3_deep_link" {
  description = "Create s3 deep link"
  type        = bool
  default     = false
}