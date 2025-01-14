aws_access_key        = "AKIAW3MEBLSPMM3M6PHU"
aws_secret_key        = "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"
aws_region            = "us-east-2"
aws_account_id        = "471112703134"
aws_access_key_shared = "AKIAQIJRSB2IJKGFXVAH"
aws_secret_key_shared = "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"
aws_region_shared     = "us-east-2"
public_key            = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC4lYozqmOTyRXX01Fhtv00HWd3B/8YR32MAlAa0lM1YUi/tCdsBrDzbILwhuMo6w6zWhH/mBNoS8pIo6ec0YR+JWzVFME2jfrC3GirSlZz89Vo7MCA82BVP3swVahTUjJSe3ou1V2fFx1T3DNBxoLvvq+/pwb7PkR+4n0XkF0QR09kX9FPfpwLvr0kQc2TSBRLMErtWN6G/bDxra2ECTqbzTvFoDZ8jZ4MUBGjTTHdrF5QxFUIpOCHCJ8vsW+Bz+OFN+s/a9cQEn01Bmfpm0v20bEfvELjRxCuG8M7fEEjkSu8saETxcyLILx4OO79EvDB3On2PSW/O/2cNiabtmosXWSVBtOPAdNh2zT2DXwYhoD0VCeWqEuOJkjlYjZ/pHuDfhVaR6Y+qR/Jwg+QOh37xQeby2tAQpFAdf5cuAzpH5MHyYT5r0bH0LCexKfYbZQR1ahS8R4QtfGxeO0PJKRFUvwoDw/1sNUbUaKjyAnFwvNdVyoH8BVE7JrysYBhmpc= cristiandulcey@Cristians-MacBook-Pro.local"
namespaces = ["qa"]
repos_list = ["backend-auth", "backend-notification", "frontend-admin", "backend-wallet", "backend-codes", "ws"]
microservices_list = [
  {
    name             = "backend-auth"
    namespace        = "qa"
    image            = "471112703134.dkr.ecr.us-east-2.amazonaws.com/backend-auth:qa-latest"
    port             = 3000
    replicas         = 1
    node_port        = 3000
    type_port        = "ClusterIP"
    commands = []
    commands_job = []
    "var_envs" = []
    "var_envs_job" = []
    apply_migrations = false
  },
  {
    name             = "backend-notification"
    namespace        = "qa"
    image            = "471112703134.dkr.ecr.us-east-2.amazonaws.com/backend-notification:qa-latest"
    port             = 3000
    replicas         = 1
    node_port        = 3000
    type_port        = "ClusterIP"
    commands = []
    commands_job = []
    "var_envs" = []
    "var_envs_job" = []
    apply_migrations = false
  },
  {
    name             = "frontend-admin"
    namespace        = "qa"
    image            = "471112703134.dkr.ecr.us-east-2.amazonaws.com/frontend-admin:qa-latest"
    port             = 3000
    replicas         = 1
    node_port        = 3000
    type_port        = "ClusterIP"
    commands = []
    commands_job = []
    "var_envs" = []
    "var_envs_job" = []
    apply_migrations = false
  },
  {
    name             = "backend-wallet"
    namespace        = "qa"
    image            = "471112703134.dkr.ecr.us-east-2.amazonaws.com/backend-wallet:qa-latest"
    port             = 3000
    replicas         = 1
    node_port        = 3000
    type_port        = "ClusterIP"
    commands = []
    commands_job = []
    "var_envs" = []
    "var_envs_job" = []
    apply_migrations = false
  },
  {
    name             = "backend-codes"
    namespace        = "qa"
    image            = "471112703134.dkr.ecr.us-east-2.amazonaws.com/backend-codes:main-latest"
    port             = 3000
    replicas         = 1
    node_port        = 3000
    type_port        = "ClusterIP"
    commands = []
    commands_job = []
    "var_envs" = []
    "var_envs_job" = []
    apply_migrations = false
  },
  {
    name             = "backend-ws"
    namespace        = "qa"
    image            = "471112703134.dkr.ecr.us-east-2.amazonaws.com/ws:qa-latest"
    port             = 3000
    replicas         = 1
    node_port        = 3000
    type_port        = "ClusterIP"
    commands = []
    commands_job = []
    "var_envs" = []
    "var_envs_job" = []
    apply_migrations = false
  },
]
traefik_envs = [
  {
    domain       = "qa.auth.walletguru.co"
    namespace    = "qa"
    service_name = "backend-auth"
    service_port = "3000"
    traefik_name = "auth"
  },
  {
    domain       = "qa.notification.walletguru.co"
    namespace    = "qa"
    service_name = "backend-notification"
    service_port = "3000"
    traefik_name = "notification"
  },
  {
    domain       = "qa.admin.walletguru.co"
    namespace    = "qa"
    service_name = "frontend-admin"
    service_port = "3000"
    traefik_name = "admin"
  },
  {
    domain       = "qa.wallet.walletguru.co"
    namespace    = "qa"
    service_name = "backend-wallet"
    service_port = "3000"
    traefik_name = "wallet"
  },
  {
    domain       = "codes.walletguru.co"
    namespace    = "qa"
    service_name = "backend-codes"
    service_port = "3000"
    traefik_name = "codes"
  },
  {
    domain       = "qa.rafiki.walletguru.co"
    namespace    = "default"
    service_name = "rafiki-rafiki-frontend"
    service_port = "3010"
    traefik_name = "rafiki-frontend"
  },
  {
    domain       = "qa.graphql.walletguru.co"
    namespace    = "default"
    service_name = "rafiki-rafiki-backend"
    service_port = "3001"
    traefik_name = "graphql-backend"
  },
  {
    domain       = "qa.rafiki-auth.walletguru.co"
    namespace    = "default"
    service_name = "rafiki-rafiki-auth"
    service_port = "3006"
    traefik_name = "rafiki-auth"
  },
  {
    domain       = "qa.walletguru.me"
    namespace    = "default"
    service_name = "rafiki-rafiki-backend"
    service_port = "80"
    traefik_name = "rafiki-open-payments"
  },
  {
    domain       = "qa.interaction.walletguru.co"
    namespace    = "default"
    service_name = "rafiki-rafiki-auth"
    service_port = "3009"
    traefik_name = "rafiki-interaction"
  },
  {
    domain       = "qa.mock.walletguru.co"
    namespace    = "default"
    service_name = "rafiki-rafiki-mock"
    service_port = "3030"
    traefik_name = "rafiki-mock"
  },
  {
    domain       = "qa.websocket.walletguru.co"
    namespace    = "qa"
    service_name = "backend-ws"
    service_port = "3000"
    traefik_name = "ws"
  }
]
records_list = [
  {
    name = "qa.admin.walletguru.co"
    type = "CNAME"
    records = ["a94705f6350834a51a99e08b95236f24-1640821681.us-east-2.elb.amazonaws.com"]
  },
  {
    name = "qa.auth.walletguru.co"
    type = "CNAME"
    records = ["a94705f6350834a51a99e08b95236f24-1640821681.us-east-2.elb.amazonaws.com"]
  },
  {
    name = "qa.notification.walletguru.co"
    type = "CNAME"
    records = ["a94705f6350834a51a99e08b95236f24-1640821681.us-east-2.elb.amazonaws.com"]
  },
  {
    name = "qa.wallet.walletguru.co"
    type = "CNAME"
    records = ["a94705f6350834a51a99e08b95236f24-1640821681.us-east-2.elb.amazonaws.com"]
  },
  {
    name = "codes.walletguru.co"
    type = "CNAME"
    records = ["a94705f6350834a51a99e08b95236f24-1640821681.us-east-2.elb.amazonaws.com"]
  },
   {
    name = "qa.rafiki.walletguru.co"
    type = "CNAME"
    records = ["a94705f6350834a51a99e08b95236f24-1640821681.us-east-2.elb.amazonaws.com"]
  },
  {
    name = "qa.graphql.walletguru.co"
    type = "CNAME"
    records = ["a94705f6350834a51a99e08b95236f24-1640821681.us-east-2.elb.amazonaws.com"]
  },
  {
    name = "qa.rafiki-auth.walletguru.co"
    type = "CNAME"
    records = ["a94705f6350834a51a99e08b95236f24-1640821681.us-east-2.elb.amazonaws.com"]
  },
  {
    name = "qa.walletguru.me"
    type = "CNAME"
    records = ["a94705f6350834a51a99e08b95236f24-1640821681.us-east-2.elb.amazonaws.com"]
    zone_id_shared = "Z005616523M0XVD03LD0M"
  },
  {
    name = "qa.interaction.walletguru.co"
    type = "CNAME"
    records = ["a94705f6350834a51a99e08b95236f24-1640821681.us-east-2.elb.amazonaws.com"]
  },
  {
    name = "qa.mock.walletguru.co"
    type = "CNAME"
    records = ["a94705f6350834a51a99e08b95236f24-1640821681.us-east-2.elb.amazonaws.com"]
  },
  {
    name = "qa.websocket.walletguru.co"
    type = "CNAME"
    records = ["a94705f6350834a51a99e08b95236f24-1640821681.us-east-2.elb.amazonaws.com"]
  },
]
dynamo_tables = [
  {
    name                        = "Attempts"
    billing_mode                = "PROVISIONED"
    read_capacity               = 5
    write_capacity              = 5
    hash_key                    = "Id"
    range_key                   = ""
    deletion_protection_enabled = true,
    attributes = [
      {
        name = "Id"
        type = "S"
      }
    ],
    ttl = [],
    global_secondary_index = [],
    tags = {
      Name        = "Attempts"
      Environment = "qa"
    }
  },
  {
    name                        = "Modules"
    billing_mode                = "PROVISIONED"
    read_capacity               = 5
    write_capacity              = 5
    hash_key                    = "Id"
    range_key                   = ""
    deletion_protection_enabled = true,
    attributes = [
      {
        name = "Id"
        type = "S"
      },
      {
        name = "Belongs"
        type = "S"
      },
    ],
    ttl = [],
    global_secondary_index = [
      {
        name            = "BelongsIndex"
        hash_key        = "Belongs"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      }
    ],
    tags = {
      Name        = "Modules"
      Environment = "qa"
    }
  },
  {
    name                        = "Otps"
    billing_mode                = "PROVISIONED"
    read_capacity               = 5
    write_capacity              = 5
    hash_key                    = "Email"
    range_key                   = ""
    deletion_protection_enabled = true,
    attributes = [
      {
        name = "Email"
        type = "S"
      },
      {
        name = "Otp"
        type = "S"
      }
    ],
    ttl = [
      {
        attribute_name = "Ttl"
        enabled        = true
      }
    ],
    global_secondary_index = [
      {
        name            = "EmailIndex"
        hash_key        = "Email"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      },
      {
        name            = "OtpIndex"
        hash_key        = "Otp"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      }
    ],
    tags = {
      Name        = "Otps"
      Environment = "qa"
    }
  },
  {
    name                        = "Providers"
    billing_mode                = "PROVISIONED"
    read_capacity               = 5
    write_capacity              = 5
    hash_key                    = "Id"
    range_key                   = ""
    deletion_protection_enabled = true,
    attributes = [
      {
        name = "Id"
        type = "S"
      },
    ],
    ttl = [],
    global_secondary_index = [],
    tags = {
      Name        = "Providers"
      Environment = "qa"
    }
  },
  {
    name                        = "Roles"
    billing_mode                = "PROVISIONED"
    read_capacity               = 5
    write_capacity              = 5
    hash_key                    = "Id"
    range_key                   = ""
    deletion_protection_enabled = true,
    attributes = [
      {
        name = "Id"
        type = "S"
      },
      {
        name = "ProviderId"
        type = "S"
      },
    ],
    ttl = [],
    global_secondary_index = [
      {
        name            = "ProviderIdIndex"
        hash_key        = "ProviderId"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      }
    ],
    tags = {
      Name        = "Roles"
      Environment = "qa"
    }
  },
  {
    name                        = "Users"
    billing_mode                = "PROVISIONED"
    read_capacity               = 5
    write_capacity              = 5
    hash_key                    = "Id"
    range_key                   = ""
    deletion_protection_enabled = true,
    attributes = [
      {
        name = "Id"
        type = "S"
      },
      {
        name = "Email"
        type = "S"
      },
      {
        name = "Type"
        type = "S"
      },
      {
        name = "Phone"
        type = "S"
      },
    ],
    ttl = [],
    global_secondary_index = [
      {
        name            = "EmailIndex"
        hash_key        = "Email"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      },
      {
        name            = "UserTypeIndex"
        hash_key        = "Type"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      },
      {
        name            = "PhoneIndex"
        hash_key        = "Phone"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      }
    ],
    tags = {
      Name        = "Users"
      Environment = "qa"
    }
  },
  {
    name                        = "Wallets"
    billing_mode                = "PROVISIONED"
    read_capacity               = 5
    write_capacity              = 5
    hash_key                    = "Id"
    range_key                   = ""
    deletion_protection_enabled = true,
    attributes = [
      {
        name = "Id"
        type = "S"
      },
      {
        name = "WalletAddress"
        type = "S"
      },
      {
        name = "RafikiId"
        type = "S"
      },
      {
        name = "ProviderId"
        type = "S"
      },
      {
        name = "UserId"
        type = "S"
      },
    ],
    ttl = [],
    global_secondary_index = [
      {
        name            = "WalletAddressIndex"
        hash_key        = "WalletAddress"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      },
      {
        name            = "RafikiIdIndex"
        hash_key        = "RafikiId"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      },
      {
        name            = "ProviderIdIndex"
        hash_key        = "ProviderId"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      },
      {
        name            = "UserIdIndex"
        hash_key        = "UserId"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      }
    ],
    tags = {
      Name        = "Wallets"
      Environment = "qa"
    }
  },
  {
    name                        = "Settings"
    billing_mode                = "PROVISIONED"
    read_capacity               = 5
    write_capacity              = 5
    hash_key                    = "Id"
    range_key                   = ""
    deletion_protection_enabled = true,
    attributes = [
      {
        name = "Id"
        type = "S"
      },
      {
        name = "Belongs"
        type = "S"
      }
    ],
    ttl = [],
    global_secondary_index = [
      {
        name            = "BelongsIndex"
        hash_key        = "Belongs"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      }
    ],
    tags = {
      Name        = "Settings"
      Environment = "qa"
    }
  },
  {
    name                        = "StatusCode"
    billing_mode                = "PROVISIONED"
    read_capacity               = 5
    write_capacity              = 5
    hash_key                    = "Id"
    range_key                   = ""
    deletion_protection_enabled = true,
    attributes = [
      {
        name = "Id"
        type = "S"
      },

    ],
    ttl = [],
    global_secondary_index = [
      {
        name            = "IdIndex"
        hash_key        = "Id"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      }
    ],
    tags = {
      Name        = "StatusCode"
      Environment = "dev"
    }
  },
  {
    name                        = "PaymentParameters"
    billing_mode                = "PROVISIONED"
    read_capacity               = 5
    write_capacity              = 5
    hash_key                    = "Id"
    range_key                   = ""
    deletion_protection_enabled = true,
    attributes = [
      {
        name = "Id"
        type = "S"
      },
      {
        name = "ServiceProviderId"
        type = "S"
      },
      {
        name = "Interval"
        type = "S"
      },
    ],
    ttl = [],
    global_secondary_index = [
      {
        name            = "ServiceProviderIdIndex"
        hash_key        = "ServiceProviderId"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      },{
        name            = "IntervalIndex"
        hash_key        = "Interval"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      },
    ],
    tags = {
      Name        = "PaymentParameters"
      Environment = "qa"
    }
  },
  {
    name                        = "TimeIntervals"
    billing_mode                = "PROVISIONED"
    read_capacity               = 5
    write_capacity              = 5
    hash_key                    = "Id"
    range_key                   = ""
    deletion_protection_enabled = true,
    attributes = [
      {
        name = "Id"
        type = "S"
      },
    ],
    ttl = [],
    global_secondary_index = [
      {
        name            = "IdIndex"
        hash_key        = "Id"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      }
    ],
    tags = {
      Name        = "TimeIntervals"
      Environment = "qa"
    }
  },
  {
    name                        = "FeeConfigurations"
    billing_mode                = "PROVISIONED"
    read_capacity               = 5
    write_capacity              = 5
    hash_key                    = "Id"
    range_key                   = ""
    deletion_protection_enabled = true,
    attributes = [
      {
        name = "Id"
        type = "S"
      },
      {
        name = "ServiceProviderId"
        type = "S"
      },
    ],
    ttl = [],
    global_secondary_index = [
      {
        name            = "IdIndex"
        hash_key        = "Id"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      },
      {
        name            = "ServiceProviderIdIndex"
        hash_key        = "ServiceProviderId"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      }
    ],
    tags = {
      Name        = "FeeConfigurations"
      Environment = "qa"
    }
  },
  {
    name                        = "Rates"
    billing_mode                = "PROVISIONED"
    read_capacity               = 5
    write_capacity              = 5
    hash_key                    = "Id"
    range_key                   = ""
    deletion_protection_enabled = true,
    attributes = [
      {
        name = "Id"
        type = "S"
      }
    ],
    ttl = [],
    global_secondary_index = [
    ],
    tags = {
      Name        = "Rates"
      Environment = "qa"
    }
  },
  {
    name                        = "SocketKeys"
    billing_mode                = "PROVISIONED"
    read_capacity               = 5
    write_capacity              = 5
    hash_key                    = "Id"
    range_key                   = ""
    deletion_protection_enabled = true,
    attributes = [
      {
        name = "Id"
        type = "S"
      },
      {
        name = "ServiceProviderId"
        type = "S"
      },
      {
        name = "PublicKey"
        type = "S"
      }
    ],
    ttl = [],
    global_secondary_index = [
      {
        name            = "IdIndex"
        hash_key        = "Id"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      },
      {
        name            = "ServiceProviderIdIndex"
        hash_key        = "ServiceProviderId"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      },
      {
        name            = "PublicKeyIndex"
        hash_key        = "PublicKey"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      }
    ],
    tags = {
      Name        = "SocketKeys"
      Environment = "qa"
    }
  },
  {
    name                        = "NotificationSettings"
    billing_mode                = "PROVISIONED"
    read_capacity               = 5
    write_capacity              = 5
    hash_key                    = "Id"
    range_key                   = ""
    deletion_protection_enabled = true,
    attributes = [
      {
        name = "Id"
        type = "S"
      },
      {
        name = "UserId"
        type = "S"
      }
    ],
    ttl = [],
    global_secondary_index = [
      {
        name            = "IdIndex"
        hash_key        = "Id"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      },
      {
        name            = "UserIdIndex"
        hash_key        = "UserId"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      }
    ],
    tags = {
      Name        = "NotificationSettings"
      Environment = "qa"
    }
  },
  {
    name                        = "UserIncoming"
    billing_mode                = "PROVISIONED"
    read_capacity               = 5
    write_capacity              = 5
    hash_key                    = "Id"
    range_key                   = ""
    deletion_protection_enabled = true,
    attributes = [
      {
        name = "Id"
        type = "S"
      },
      {
        name = "ServiceProviderId"
        type = "S"
      },
      {
        name = "UserId"
        type = "S"
      },
      {
        name = "IncomingPaymentId"
        type = "S"
      }
    ],
    ttl = [],
    global_secondary_index = [
      {
        name            = "IdIndex"
        hash_key        = "Id"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      },
      {
        name            = "UserIdIndex"
        hash_key        = "UserId"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      },
      {
        name            = "ServiceProviderIdIndex"
        hash_key        = "ServiceProviderId"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      },
      {
        name            = "IncomingPaymentIdIndex"
        hash_key        = "IncomingPaymentId"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      }
    ],
    tags = {
      Name        = "UserIncoming"
      Environment = "qa"
    }
  },
  {
    name                        = "Transactions"
    billing_mode                = "PROVISIONED"
    read_capacity               = 5
    write_capacity              = 5
    hash_key                    = "Id"
    range_key                   = ""
    deletion_protection_enabled = true,
    attributes = [
      {
        name = "Id"
        type = "S"
      },
      {
        name = "OutgoingPaymentId"
        type = "S"
      },
      {
        name = "IncomingPaymentId"
        type = "S"
      },
      {
        name = "WalletAddressId"
        type = "S"
      },
      {
        name = "ReceiverUrl"
        type = "S"
      }
    ],
    ttl = [],
    global_secondary_index = [
      {
        name            = "IdIndex"
        hash_key        = "Id"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      },
      {
        name            = "OutgoingPaymentIdIndex"
        hash_key        = "OutgoingPaymentId"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      },
      {
        name            = "IncomingPaymentIdIndex"
        hash_key        = "IncomingPaymentId"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      },
      {
        name            = "WalletAddressIdIndex"
        hash_key        = "WalletAddressId"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      },
      {
        name            = "ReceiverUrlIndex"
        hash_key        = "ReceiverUrl"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
        non_key_attributes = []
      }
    ],
    tags = {
      Name        = "UserIncoming"
      Environment = "qa"
    }
  },
  {
    name                        = "WebSocketActions"
    billing_mode                = "PROVISIONED"
    read_capacity               = 5
    write_capacity              = 5
    hash_key                    = "Id"
    range_key                   = ""
    deletion_protection_enabled = true,
    attributes = [
      {
        name = "Id"
        type = "S"
      }
    ],
    ttl = [],
    global_secondary_index = [],
    tags = {
      Name        = "WebSocketActions"
      Environment = "qa"
    }
  },
  {
    name                        = "ClearPayments"
    billing_mode                = "PROVISIONED"
    read_capacity               = 5
    write_capacity              = 5
    hash_key                    = "Id"
    range_key                   = ""
    deletion_protection_enabled = true,
    attributes = [
      {
        name = "Id"
        type = "S"
      },
      {
        name = "ServiceProviderId"
        type = "S"
      }
    ],
    ttl = [],
    global_secondary_index = [
        {
            name            = "ServiceProviderIdIndex"
            hash_key        = "ServiceProviderId"
            range_key       = ""
            write_capacity  = 5
            read_capacity   = 5
            projection_type = "ALL"
            non_key_attributes = []
        }
    ],
    tags = {
      Name        = "ClearPayments"
      Environment = "qa"
    }
  },
  {
    name                        = "Refunds"
    billing_mode                = "PROVISIONED"
    read_capacity               = 5
    write_capacity              = 5
    hash_key                    = "Id"
    range_key                   = ""
    deletion_protection_enabled = true,
    attributes = [
      {
        name = "Id"
        type = "S"
      },
      {
        name = "ServiceProviderId"
        type = "S"
      }
    ],
    ttl = [],
    global_secondary_index = [
        {
            name            = "ServiceProviderIdIndex"
            hash_key        = "ServiceProviderId"
            range_key       = ""
            write_capacity  = 5
            read_capacity   = 5
            projection_type = "ALL"
            non_key_attributes = []
        }
    ],
    tags = {
      Name        = "Refunds"
      Environment = "qa"
    }
  },
]
name_queue = "paystreme-notifications-qa"
s3_buckets = [
  {
    name = "walletguru-qa"
  }
]
create_domain                  = false
zone_id                        = "Z00522293EO3PH1CIDJ"
email_configuration_source_arn = "arn:aws:ses:us-east-2:471112703134:identity/walletguru.co"