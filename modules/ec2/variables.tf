variable "ami-id" {
  type        = string
  description = "AMI ID"
  default     = "ami-0862be96e41dcbf74"
}

variable "instance_type" {
  type        = string
  description = "Instance Type"
  default     = "t3.large"
}

variable "availability_zone" {
  type        = string
  description = "Availability Zone"
  default     = "us-east-2a"
}

variable "name" {
    type        = string
    description = "Name of the EC2 instance"
}

variable "key_name" {
    type        = string
    description = "Name of the key pair"
}

variable "subnet_id" {
    type        = string
    description = "Subnet ID"
}

variable "vpc_security_group_ids" {
    type        = list(string)
    description = "Security Group IDs"
}

variable "associate_public_ip_address" {
    type        = bool
    description = "Associate Public IP Address"
    default     = true
}

variable "volume_size" {
    type        = number
    description = "Volume Size"
    default     = 50
}

variable "volume_type" {
    type        = string
    description = "Volume Type"
    default     = "gp2"
}

variable "init_script" {
    type        = string
    description = "Path to the initialization script"
    default = "scripts/hello.sh"
}