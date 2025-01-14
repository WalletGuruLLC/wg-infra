aws_access_key        = "AKIAYQYUA7MAMGR56R5S"
aws_secret_key        = "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"
aws_region            = "us-east-2"
aws_account_id        = "585768172288"
aws_access_key_shared = "AKIAQIJRSB2IJKGFXVAH"
aws_secret_key_shared = "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"
aws_region_shared     = "us-east-2"
public_key            = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC4lYozqmOTyRXX01Fhtv00HWd3B/8YR32MAlAa0lM1YUi/tCdsBrDzbILwhuMo6w6zWhH/mBNoS8pIo6ec0YR+JWzVFME2jfrC3GirSlZz89Vo7MCA82BVP3swVahTUjJSe3ou1V2fFx1T3DNBxoLvvq+/pwb7PkR+4n0XkF0QR09kX9FPfpwLvr0kQc2TSBRLMErtWN6G/bDxra2ECTqbzTvFoDZ8jZ4MUBGjTTHdrF5QxFUIpOCHCJ8vsW+Bz+OFN+s/a9cQEn01Bmfpm0v20bEfvELjRxCuG8M7fEEjkSu8saETxcyLILx4OO79EvDB3On2PSW/O/2cNiabtmosXWSVBtOPAdNh2zT2DXwYhoD0VCeWqEuOJkjlYjZ/pHuDfhVaR6Y+qR/Jwg+QOh37xQeby2tAQpFAdf5cuAzpH5MHyYT5r0bH0LCexKfYbZQR1ahS8R4QtfGxeO0PJKRFUvwoDw/1sNUbUaKjyAnFwvNdVyoH8BVE7JrysYBhmpc= cristiandulcey@Cristians-MacBook-Pro.local"
namespaces = ["prd"]
repos_list = [
  "backend-auth", "backend-notification", "frontend-admin", "backend-wallet", "backend-codes", "backend-countries-now", "ws"
]
microservices_list = [
  {
    name             = "backend-auth"
    namespace        = "prd"
    image            = "585768172288.dkr.ecr.us-east-2.amazonaws.com/backend-auth:prd-latest"
    port             = 3000
    replicas         = 3
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
    namespace        = "prd"
    image            = "585768172288.dkr.ecr.us-east-2.amazonaws.com/backend-notification:prd-latest"
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
    namespace        = "prd"
    image            = "585768172288.dkr.ecr.us-east-2.amazonaws.com/frontend-admin:prd-latest"
    port             = 3000
    replicas         = 3
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
    namespace        = "prd"
    image            = "585768172288.dkr.ecr.us-east-2.amazonaws.com/backend-wallet:prd-latest"
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
    name             = "backend-countries-now"
    namespace        = "prd"
    image            = "585768172288.dkr.ecr.us-east-2.amazonaws.com/backend-countries-now:main-latest"
    port             = 3000
    replicas         = 3
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
    namespace        = "prd"
    image            = "585768172288.dkr.ecr.us-east-2.amazonaws.com/ws:prd-latest"
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
    domain       = "auth.walletguru.co"
    namespace    = "prd"
    service_name = "backend-auth"
    service_port = "3000"
    traefik_name = "auth"
  },
  {
    domain       = "notification.walletguru.co"
    namespace    = "prd"
    service_name = "backend-notification"
    service_port = "3000"
    traefik_name = "notification"
  },
  {
    domain       = "admin.walletguru.co"
    namespace    = "prd"
    service_name = "frontend-admin"
    service_port = "3000"
    traefik_name = "admin"
  },
  {
    domain       = "wallet.walletguru.co"
    namespace    = "prd"
    service_name = "backend-wallet"
    service_port = "3000"
    traefik_name = "wallet"
  },
  {
    domain       = "countriesnow.walletguru.co"
    namespace    = "prd"
    service_name = "backend-countries-now"
    service_port = "3000"
    traefik_name = "countries-now"
  },
  {
    domain       = "rafiki.walletguru.co"
    namespace    = "default"
    service_name = "rafiki-rafiki-frontend"
    service_port = "3010"
    traefik_name = "rafiki-frontend"
  },
  {
    domain       = "graphql.walletguru.co"
    namespace    = "default"
    service_name = "rafiki-rafiki-backend"
    service_port = "3001"
    traefik_name = "graphql-backend"
  },
  {
    domain       = "rafiki-auth.walletguru.co"
    namespace    = "default"
    service_name = "rafiki-rafiki-auth"
    service_port = "3006"
    traefik_name = "rafiki-auth"
  },
  {
    domain       = "interaction.walletguru.co"
    namespace    = "default"
    service_name = "rafiki-rafiki-auth"
    service_port = "3009"
    traefik_name = "rafiki-interaction"
  },
  {
    domain       = "mock.walletguru.co"
    namespace    = "default"
    service_name = "rafiki-rafiki-mock"
    service_port = "3030"
    traefik_name = "rafiki-mock"
  },
  {
    domain       = "websocket.walletguru.co"
    namespace    = "prd"
    service_name = "backend-ws"
    service_port = "3000"
    traefik_name = "ws"
  }
  #   {
  #     domain       = "walletguru.me"
  #     namespace    = "default"
  #     service_name = "rafiki-rafiki-backend"
  #     service_port = "80"
  #     traefik_name = "rafiki-open-payments"
  #   },
]
records_list = [
  {
    name = "admin.walletguru.co"
    type = "CNAME"
    records = ["a068aec774e424f1898c670af6e482a7-1086058173.us-east-2.elb.amazonaws.com"]
  },
  {
    name = "auth.walletguru.co"
    type = "CNAME"
    records = ["a068aec774e424f1898c670af6e482a7-1086058173.us-east-2.elb.amazonaws.com"]
  },
  {
    name = "notification.walletguru.co"
    type = "CNAME"
    records = ["a068aec774e424f1898c670af6e482a7-1086058173.us-east-2.elb.amazonaws.com"]
  },
  {
    name = "wallet.walletguru.co"
    type = "CNAME"
    records = ["a068aec774e424f1898c670af6e482a7-1086058173.us-east-2.elb.amazonaws.com"]
  },
  {
    name = "rafiki.walletguru.co"
    type = "CNAME"
    records = ["a068aec774e424f1898c670af6e482a7-1086058173.us-east-2.elb.amazonaws.com"]
  },
  {
    name = "graphql.walletguru.co"
    type = "CNAME"
    records = ["a068aec774e424f1898c670af6e482a7-1086058173.us-east-2.elb.amazonaws.com"]
  },
  {
    name = "rafiki-auth.walletguru.co"
    type = "CNAME"
    records = ["a068aec774e424f1898c670af6e482a7-1086058173.us-east-2.elb.amazonaws.com"]
  },
  {
    name = "interaction.walletguru.co"
    type = "CNAME"
    records = ["a068aec774e424f1898c670af6e482a7-1086058173.us-east-2.elb.amazonaws.com"]
  },
  {
    name = "mock.walletguru.co"
    type = "CNAME"
    records = ["a068aec774e424f1898c670af6e482a7-1086058173.us-east-2.elb.amazonaws.com"]
  },
  {
    name = "24husscwfsv2ee6dlmei5km233lstyam._domainkey.walletguru.co"
    type = "CNAME"
    records = ["24husscwfsv2ee6dlmei5km233lstyam.dkim.amazonses.com"]
  },
  {
    name = "ndnqcsjqbrf77sgkl66xbgnfycgeu3dz._domainkey.walletguru.co"
    type = "CNAME"
    records = ["ndnqcsjqbrf77sgkl66xbgnfycgeu3dz.dkim.amazonses.com"]
  },
  {
    name = "qbh3t5nceh6aropkgdzcvkl6ef377zyd._domainkey.walletguru.co"
    type = "CNAME"
    records = ["qbh3t5nceh6aropkgdzcvkl6ef377zyd.dkim.amazonses.com"]
  },
  {
    name = "countriesnow.walletguru.co"
    type = "CNAME"
    records = ["a068aec774e424f1898c670af6e482a7-1086058173.us-east-2.elb.amazonaws.com"]
  },
  {
    name = "websocket.walletguru.co"
    type = "CNAME"
    records = ["a068aec774e424f1898c670af6e482a7-1086058173.us-east-2.elb.amazonaws.com"]
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
      Environment = "prd"
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
      Environment = "prd"
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
      Environment = "prd"
    }
  },
  {
    name                        = "Providers"
    billing_mode                = "PROVISIONED"
    read_capacity               = 40
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
      Environment = "prd"
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
      Environment = "prd"
    }
  },
  {
    name                        = "Users"
    billing_mode                = "PROVISIONED"
    read_capacity               = 40
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
      Environment = "prd"
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
      }
    ],
    ttl = [],
    global_secondary_index = [
      {
        name            = "WalletAddressIndex"
        hash_key        = "WalletAddress"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 100
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
      Environment = "prd"
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
      Environment = "prd"
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
      }, {
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
      Environment = "prd"
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
      Environment = "prd"
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
      Environment = "prd"
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
      Environment = "sth"
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
      Environment = "prd"
    }
  },
  {
    name                        = "Transactions"
    billing_mode                = "PROVISIONED"
    read_capacity               = 100
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
        read_capacity   = 10
        projection_type = "ALL"
        non_key_attributes = []
      },
      {
        name            = "OutgoingPaymentIdIndex"
        hash_key        = "OutgoingPaymentId"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 10
        projection_type = "ALL"
        non_key_attributes = []
      },
      {
        name            = "IncomingPaymentIdIndex"
        hash_key        = "IncomingPaymentId"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 10
        projection_type = "ALL"
        non_key_attributes = []
      },
      {
        name            = "WalletAddressIdIndex"
        hash_key        = "WalletAddressId"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 100
        projection_type = "ALL"
        non_key_attributes = []
      },
      {
        name            = "ReceiverUrlIndex"
        hash_key        = "ReceiverUrl"
        range_key       = ""
        write_capacity  = 5
        read_capacity   = 10
        projection_type = "ALL"
        non_key_attributes = []
      }
    ],
    tags = {
      Name        = "UserIncoming"
      Environment = "prd"
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
      Environment = "prd"
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
      Environment = "prd"
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
      Environment = "prd"
    }
  },
]
name_queue = "paystreme-notifications-prd"
s3_buckets = [
  {
    name = "walletguru-prd"
  }
]
create_domain                  = false
zone_id                        = "Z00522293EO3PH1CIDJ"
email_configuration_source_arn = "arn:aws:ses:us-east-2:585768172288:identity/walletguru.co"