variable "zone_id" {
    type        = string
    description = "The ID of the hosted zone"
}

variable "name" {
    type        = string
    description = "The name of the record"
}

variable "type" {
    type        = string
    description = "The type of the record"
}

variable "records" {
    type        = list(string)
    description = "A list of records"
}