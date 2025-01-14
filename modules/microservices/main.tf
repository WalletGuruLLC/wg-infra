data "kubernetes_namespace" "example" {
  metadata {
    name = var.namespace
  }
}


resource "kubernetes_deployment" "this" {
  metadata {
    name      = var.name
    namespace = var.namespace
  }

  spec {
    replicas = var.replicas
    selector {
      match_labels = {
        "app" = var.name
      }
    }

    template {
      metadata {
        labels = {
          "app" = var.name
        }
      }

      spec {
        image_pull_secrets {
          name = "docker-cfg"
        }
        container {
          name              = var.name
          image             = var.image
          command           = var.commands
          image_pull_policy = "Always"
          port {
            container_port = var.port
          }
          dynamic "env" {
            for_each = var.var_envs
            content {
              name  = env.value.name
              value = env.value.value
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "this" {
  metadata {
    name      = var.name
    namespace = var.namespace
  }
  spec {
    selector = {
      "app" = var.name
    }
    type = var.type_port
    port {
      name = "web"
      #      node_port   = var.node_port
      target_port = var.port
      port        = var.port
    }
  }
}

resource "kubernetes_job" "apply_migrations" {
  depends_on = [kubernetes_deployment.this]
  count = var.apply_migrations ? 1 : 0
  metadata {
    name      = var.name
    namespace = var.namespace
    #    labels = {
    #      "random" = 0
    #    }
  }
  spec {
    template {
      metadata {}
      spec {
        image_pull_secrets {
          name = "docker-cfg"
        }
        container {
          name              = var.name
          image             = var.image
          command           = var.commands_job
          image_pull_policy = "Always"
          dynamic "env" {
            for_each = var.var_envs_job
            content {
              name  = env.value.name
              value = env.value.value
            }
          }
        }
        restart_policy = "Never"
      }
    }
    backoff_limit = 4
  }
  wait_for_completion = true
  timeouts {
    create = "5m"
    update = "5m"
  }
}