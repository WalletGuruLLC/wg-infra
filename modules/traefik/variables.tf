variable "traefik_name" {
  description = "Name of the Traefik instance"
}
variable "namespace" {
  description = "Namespace to deploy Traefik to"
}
variable "domain" {
  description = "Domain to use for Traefik"
}
variable "service_name" {
  description = "Name of the Traefik service"
}
variable "service_port" {
  description = "Port of the Traefik service"
}