variable "name" {
  description = "Name of the deployment"
}
variable "namespace" {
  description = "Namespace"
}
variable "image" {
  description = "Docker image"
}
variable "port" {
  description = "Port"
}
variable "replicas" {
  description = "Replicas"
}
variable "var_envs" {
  description = "Environment variables"
}
variable "var_envs_job" {
  description = "Environment variables"
}
variable "apply_migrations" {
  description = "variable to run job"
}
variable "node_port" {
  description = "Node port"
}
variable "type_port" {
  description = "Type port"
}
variable "commands" {
  description = "commands to run"
}
variable "commands_job" {
  description = "commands to run"
}