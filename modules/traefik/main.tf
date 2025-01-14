resource "kubernetes_manifest" "traefik-ingress" {
  manifest   = {
    "apiVersion" = "traefik.containo.us/v1alpha1"
    "kind"       = "IngressRoute"
    "metadata"   = {
      "name"      = var.traefik_name
      "namespace" = var.namespace

    }
    "spec" = {
      "entryPoints" = [
        "websecure",
      ]
      "routes" = [
        {
          "kind"     = "Rule"
          "match"    = "Host(`${var.domain}`)"
          "services" = [
            {
              "name" = var.service_name
              "port" = var.service_port
#               "sticky" = {
#                 "cookie" = {
#                   "name" = "sid"
#                   "httpOnly" = true
#                   "secure" = true
#                 }
#               }
            },
          ]
          middlewares = [
            {
              "name" = var.traefik_name
              "namespace" = var.namespace
            },
            {
              "name" = "${var.traefik_name}-to-https"
                "namespace" = var.namespace
            },
          ]
        },
      ]
      "tls" = {
        "certResolver" = "le"
      }
    }
  }
}

resource "kubernetes_manifest" "traefik-ingress-http" {
  manifest   = {
    "apiVersion" = "traefik.containo.us/v1alpha1"
    "kind"       = "IngressRoute"
    "metadata"   = {
      "name"      = "${var.traefik_name}-http"
      "namespace" = var.namespace

    }
    "spec" = {
      "entryPoints" = [
        "web",
      ]
      "routes" = [
        {
          "kind"     = "Rule"
          "match"    = "Host(`${var.domain}`)"
          "services" = [
            {
              "name" = var.service_name
              "port" = var.service_port
            },
          ]
          middlewares = [
            {
              "name" = "${var.traefik_name}-to-https"
                "namespace" = var.namespace
            },
          ]
        },
      ]
#       "tls" = {
#         "certResolver" = "le"
#       }
    }
  }
}


resource "kubernetes_manifest" "traefik-ingress-middleware" {
  manifest = {
    "apiVersion" = "traefik.containo.us/v1alpha1"
    "kind"       = "Middleware"
    "metadata"   = {
      "name"      = var.traefik_name
      "namespace" = var.namespace
    }
    "spec" = {
      "headers" = {
        "customRequestHeaders" = {
          "X-Forwarded-Proto" = "https,wss"
#          "Connection"        = "keep-alive, Upgrade"
#          "Upgrade"           = "Websocket"
        }
      }
    }
  }
}


resource "kubernetes_manifest" "traefik-ingress-middleware-to-https" {
  manifest = {
    "apiVersion" = "traefik.containo.us/v1alpha1"
    "kind"       = "Middleware"
    "metadata"   = {
      "name"      = "${var.traefik_name}-to-https"
      "namespace" = var.namespace
    }
    "spec" = {
      "redirectScheme" = {
        "scheme"    = "https"
        "permanent" = "true"
      }
    }
  }
}