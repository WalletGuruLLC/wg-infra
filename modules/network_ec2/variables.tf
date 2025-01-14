variable "name" {
  type        = string
  description = "Name of the network"
}

variable "incoming_ports" {
  type = list(object({
    from     = number
    to       = number
    protocol = string
  }))
  description = "Incomming ports"
}

variable "outgoing_ports" {
  type = list(object({
    from     = number
    to       = number
    protocol = string
  }))
  description = "Outgoing ports"
}

