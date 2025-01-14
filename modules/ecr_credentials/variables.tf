variable "namespace" {
  type        = string
  description = "Name of Namespace"
}

variable "name_secret" {
  type        = string
  description = "Name of Secret"
}

variable "aws_access_key" {
  type        = string
  description = "AWS Access Key"
}

variable "aws_secret_key" {
  type        = string
  description = "AWS Secret Key"
}

variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "aws_account_id" {
  type        = string
  description = "AWS Account ID"
}
