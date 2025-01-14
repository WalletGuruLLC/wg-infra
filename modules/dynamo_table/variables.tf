variable "name" {
  description = "Name of table"
  type        = string
}

variable "billing_mode" {
  description = "Billing mode of table"
  type        = string
}

variable "read_capacity" {
  description = "Read capacity of table"
  type        = number
  default     = 5
}

variable "write_capacity" {
  description = "Write capacity of table"
  type        = number
  default     = 5
}

variable "hash_key" {
  description = "Hash key of table"
  type        = string
}

variable "range_key" {
  description = "Range key of table"
  type        = string
  default     = ""
}

variable "deletion_protection_enabled" {
  description = "Deletion protection enabled"
  type        = bool
  default     = true
}

variable "attributes" {
  description = "Attributes of table"
  type        = list(object({
    name = string
    type = string
  }))
}

variable "ttl" {
  description = "TTL of table"
  type        = list(object({
    attribute_name = string
    enabled        = bool
  }))
}

variable "global_secondary_index" {
  description = "Global secondary index of table"
  type        = list(object({
    name               = string
    hash_key           = string
    range_key          = string
    write_capacity     = number
    read_capacity      = number
    projection_type    = string
    non_key_attributes = list(string)
  }))
}

variable "tags" {
  description = "Tags of table"
  type        = map(string)
}