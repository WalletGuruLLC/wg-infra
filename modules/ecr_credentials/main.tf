resource "kubernetes_manifest" "serviceaccount_dev_k8s_ecr_login_renew_account" {
  manifest = {
    "apiVersion" = "v1"
    "kind"       = "ServiceAccount"
    "metadata" = {
      "name"      = "k8s-ecr-login-renew-account"
      "namespace" = var.namespace
    }
  }
}

resource "kubernetes_manifest" "clusterrole_dev_k8s_ecr_login_renew_role" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind"       = "ClusterRole"
    "metadata" = {
      "name" = "k8s-ecr-login-renew-role"

    }
    "rules" = [
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "namespaces",
        ]
        "verbs" = [
          "list",
        ]
      },
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "secrets",
          "serviceaccounts",
          "serviceaccounts/token",
        ]
        "verbs" = [
          "delete",
          "create",
          "patch",
          "get",
          "list"
        ]
      },
    ]
  }
}

resource "kubernetes_manifest" "clusterrolebinding_dev_k8s_ecr_login_renew_binding" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind"       = "ClusterRoleBinding"
    "metadata" = {
      "name" = "k8s-ecr-login-renew-binding"

    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind"     = "ClusterRole"
      "name"     = "k8s-ecr-login-renew-role"
    }
    "subjects" = [
      {
        "kind"      = "ServiceAccount"
        "name"      = "k8s-ecr-login-renew-account"
        "namespace" = var.namespace
      },
    ]
  }
}

resource "kubernetes_manifest" "cronjob_dev_k8s_ecr_login_renew_cron" {
  manifest = {
    "apiVersion" = "batch/v1"
    "kind"       = "CronJob"
    "metadata" = {
      "name"      = "ecr-cred-helper"
      "namespace" = var.namespace
    }
    "spec" = {
      "concurrencyPolicy"      = "Allow"
      "failedJobsHistoryLimit" = 1
      "jobTemplate" = {
        "metadata" = {
          "creationTimestamp" = null
        }
        "spec" = {
          "template" = {
            "metadata" = {
              "creationTimestamp" = null
            }
            "spec" = {
              "containers" = [
                {
                  "env" = [
                    {
                      "name"  = "AWS_ACCESS_KEY_ID"
                      "value" = var.aws_access_key
                    },
                    {
                      "name"  = "AWS_SECRET_ACCESS_KEY"
                      "value" = var.aws_secret_key
                    },
                    {
                      "name"  = "AWS_REGION"
                      "value" = var.aws_region
                    },
                    {
                      "name"  = "DOCKER_SECRET_NAME"
                      "value" = var.name_secret
                    },
                    {
                      "name"  = "TARGET_NAMESPACE"
                      "value" = var.namespace
                    },
                    {
                      "name"  = "ACCOUNT"
                      "value" = var.aws_account_id
                    },
                  ]
                  "image"           = "odaniait/aws-kubectl:latest"
                  "imagePullPolicy" = "IfNotPresent"
                  "name"            = "k8s-ecr-login-renew"
                  "command" = [
                    "/bin/sh",
                    "-c",
                    <<EOF
                    TOKEN=`aws ecr get-login --region $AWS_REGION --registry-ids $ACCOUNT | cut -d' ' -f6`
                    echo 'ENV variables setup done.'
                    kubectl delete secret -n $TARGET_NAMESPACE --ignore-not-found $DOCKER_SECRET_NAME
                    kubectl create secret -n $TARGET_NAMESPACE docker-registry $DOCKER_SECRET_NAME --docker-server=$ACCOUNT.dkr.ecr.$AWS_REGION.amazonaws.com --docker-username=AWS --docker-password=$TOKEN --docker-email=none
                    echo "Secret created by name $DOCKER_SECRET_NAME"
                    kubectl patch serviceaccount k8s-ecr-login-renew-account -p '{"imagePullSecrets":[{"name":"'$DOCKER_SECRET_NAME'"}]}' -n $TARGET_NAMESPACE
                    echo 'All done.'
                    EOF
                  ]
                  terminationMessagePath   = "/dev/termination-log"
                  terminationMessagePolicy = "File"

                },
              ]
              "restartPolicy"                 = "Never"
              "serviceAccountName"            = "k8s-ecr-login-renew-account"
              "terminationGracePeriodSeconds" = 30
            }
          }
        }
      }
      "schedule" = "0 */6 * * *"
      #       "failedJobsHistoryLimit" = 5
      "suspend"                    = false
      "successfulJobsHistoryLimit" = 3
    }
  }
}