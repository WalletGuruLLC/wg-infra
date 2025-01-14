variable "name" {
  description = "Name user pool"
  type        = string
}

variable "username_attributes" {
  description = "Username attributes"
  type = list(string)
}

variable "deletion_protection" {
  description = "Deletion protection"
  type        = string
  default     = "ACTIVE"
}

variable "generate_secret" {
  description = "Generate secret"
  type        = bool
  default     = true
}

variable "refresh_token_validity" {
  description = "Refresh token validity"
  type        = number
  default     = 30
}

variable "auth_session_validity" {
  description = "Auth session validity"
  type        = number
  default     = 3
}

variable "access_token_validity" {
  description = "Access token validity"
  type        = number
  default     = 120
}

variable "id_token_validity" {
  description = "Id token validity"
  type        = number
  default     = 60
}

variable "email_configuration_source_arn" {
    description = "Email configuration source arn"
    type        = string
}

