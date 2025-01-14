aws_access_key        = "AKIA6GBMHYSPQLPDRT5G"
aws_secret_key        = "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"
aws_region            = "us-east-2"
aws_account_id        = "975050359967"
aws_access_key_shared = "AKIAQIJRSB2IJKGFXVAH"
aws_secret_key_shared = "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"
aws_region_shared     = "us-east-2"
public_key            = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC4lYozqmOTyRXX01Fhtv00HWd3B/8YR32MAlAa0lM1YUi/tCdsBrDzbILwhuMo6w6zWhH/mBNoS8pIo6ec0YR+JWzVFME2jfrC3GirSlZz89Vo7MCA82BVP3swVahTUjJSe3ou1V2fFx1T3DNBxoLvvq+/pwb7PkR+4n0XkF0QR09kX9FPfpwLvr0kQc2TSBRLMErtWN6G/bDxra2ECTqbzTvFoDZ8jZ4MUBGjTTHdrF5QxFUIpOCHCJ8vsW+Bz+OFN+s/a9cQEn01Bmfpm0v20bEfvELjRxCuG8M7fEEjkSu8saETxcyLILx4OO79EvDB3On2PSW/O/2cNiabtmosXWSVBtOPAdNh2zT2DXwYhoD0VCeWqEuOJkjlYjZ/pHuDfhVaR6Y+qR/Jwg+QOh37xQeby2tAQpFAdf5cuAzpH5MHyYT5r0bH0LCexKfYbZQR1ahS8R4QtfGxeO0PJKRFUvwoDw/1sNUbUaKjyAnFwvNdVyoH8BVE7JrysYBhmpc= cristiandulcey@Cristians-MacBook-Pro.local"
namespaces = ["dev"]
repos_list = ["backend-auth", "backend-notification", "frontend-admin", "backend-wallet","ws"]
microservices_list = [
  {
    name             = "backend-auth"
    namespace        = "dev"
    image            = "975050359967.dkr.ecr.us-east-2.amazonaws.com/backend-auth:development-latest"
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
    namespace        = "dev"
    image            = "975050359967.dkr.ecr.us-east-2.amazonaws.com/backend-notification:development-latest"
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
    namespace        = "dev"
    image            = "975050359967.dkr.ecr.us-east-2.amazonaws.com/frontend-admin:development-latest"
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
    namespace        = "dev"
    image            = "975050359967.dkr.ecr.us-east-2.amazonaws.com/backend-wallet:development-latest"
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
    namespace        = "dev"
    image            = "975050359967.dkr.ecr.us-east-2.amazonaws.com/ws:development-latest"
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
    domain       = "dev.auth.walletguru.co"
    namespace    = "dev"
    service_name = "backend-auth"
    service_port = "3000"
    traefik_name = "auth"
  },
  {
    domain       = "dev.notification.walletguru.co"
    namespace    = "dev"
    service_name = "backend-notification"
    service_port = "3000"
    traefik_name = "notification"
  },
  {
    domain       = "dev.admin.walletguru.co"
    namespace    = "dev"
    service_name = "frontend-admin"
    service_port = "3000"
    traefik_name = "admin"
  },
  {
    domain       = "dev.wallet.walletguru.co"
    namespace    = "dev"
    service_name = "backend-wallet"
    service_port = "3000"
    traefik_name = "wallet"
  },
  {
    domain       = "dev.rafiki.walletguru.co"
    namespace    = "default"
    service_name = "rafiki-rafiki-frontend"
    service_port = "3010"
    traefik_name = "rafiki-frontend"
  },
  {
    domain       = "dev.graphql.walletguru.co"
    namespace    = "default"
    service_name = "rafiki-rafiki-backend"
    service_port = "3001"
    traefik_name = "graphql-backend"
  },
  {
    domain       = "dev.rafiki-auth.walletguru.co"
    namespace    = "default"
    service_name = "rafiki-rafiki-auth"
    service_port = "3006"
    traefik_name = "rafiki-auth"
  },
  {
    domain       = "dev.walletguru.me"
    namespace    = "default"
    service_name = "rafiki-rafiki-backend"
    service_port = "80"
    traefik_name = "rafiki-open-payments"
  },
  {
    domain       = "dev.interaction.walletguru.co"
    namespace    = "default"
    service_name = "rafiki-rafiki-auth"
    service_port = "3009"
    traefik_name = "rafiki-interaction"
  },
  {
    domain       = "dev.mock.walletguru.co"
    namespace    = "default"
    service_name = "rafiki-rafiki-mock"
    service_port = "3030"
    traefik_name = "rafiki-mock"
  },
  {
    domain       = "dev.websocket.walletguru.co"
    namespace    = "dev"
    service_name = "backend-ws"
    service_port = "3000"
    traefik_name = "ws"
  }
]
records_list = [
  {
    name = "dev.admin.walletguru.co"
    type = "CNAME"
    records = ["a19ddf081adf74c94978f8903bc54031-411375565.us-east-2.elb.amazonaws.com"]
  },
  {
    name = "dev.auth.walletguru.co"
    type = "CNAME"
    records = ["a19ddf081adf74c94978f8903bc54031-411375565.us-east-2.elb.amazonaws.com"]
  },
  {
    name = "dev.notification.walletguru.co"
    type = "CNAME"
    records = ["a19ddf081adf74c94978f8903bc54031-411375565.us-east-2.elb.amazonaws.com"]
  },
  {
    name = "vftimymc7xgnksuvqe7glwbcfjvutsz7._domainkey.walletguru.co"
    type = "CNAME"
    records = ["vftimymc7xgnksuvqe7glwbcfjvutsz7.dkim.amazonses.com"]
  },
  {
    name = "ugcymohpz7tvyjr5zcsymxsamw55stib._domainkey.walletguru.co"
    type = "CNAME"
    records = ["ugcymohpz7tvyjr5zcsymxsamw55stib.dkim.amazonses.com"]
  },
  {
    name = "shm3eq3wwx3ivumsiyfflual6qcl67yj._domainkey.walletguru.co"
    type = "CNAME"
    records = ["shm3eq3wwx3ivumsiyfflual6qcl67yj.dkim.amazonses.com"]
  },
  {
    name = "_dmarc.walletguru.co"
    type = "TXT"
    records = ["v=DMARC1; p=none;"]
  },
  {
    name = "dev.wallet.walletguru.co"
    type = "CNAME"
    records = ["a19ddf081adf74c94978f8903bc54031-411375565.us-east-2.elb.amazonaws.com"]
  },
  {
    name = "44mh5smaunivxhr63elcbyi57l7l4lwi._domainkey.walletguru.co"
    type = "CNAME"
    records = ["44mh5smaunivxhr63elcbyi57l7l4lwi.dkim.amazonses.com"]
  },
  {
    name = "czzabqsuluhcffeu4jwnvmxoe3gwobls._domainkey.walletguru.co"
    type = "CNAME"
    records = ["czzabqsuluhcffeu4jwnvmxoe3gwobls.dkim.amazonses.com"]
  },
  {
    name = "o5v7iuqf6dvyv23b6qwlav3yhrhnqd36._domainkey.walletguru.co"
    type = "CNAME"
    records = ["o5v7iuqf6dvyv23b6qwlav3yhrhnqd36.dkim.amazonses.com"]
  },
  {
    name = "42m4w6dscge274szhjoq2u5noc3bdyzx._domainkey.walletguru.co"
    type = "CNAME"
    records = ["42m4w6dscge274szhjoq2u5noc3bdyzx.dkim.amazonses.com"]
  },
  {
    name = "eicaqbslgkarw4ip4drlikgliva6qahj._domainkey.walletguru.co"
    type = "CNAME"
    records = ["eicaqbslgkarw4ip4drlikgliva6qahj.dkim.amazonses.com"]
  },
  {
    name = "5ktwxsaan2cfxvfhv4t5mq525n4v24qj._domainkey.walletguru.co"
    type = "CNAME"
    records = ["5ktwxsaan2cfxvfhv4t5mq525n4v24qj.dkim.amazonses.com"]
  },
  {
    name = "dev.rafiki.walletguru.co"
    type = "CNAME"
    records = ["a19ddf081adf74c94978f8903bc54031-411375565.us-east-2.elb.amazonaws.com"]
  },
  {
    name = "dev.graphql.walletguru.co"
    type = "CNAME"
    records = ["a19ddf081adf74c94978f8903bc54031-411375565.us-east-2.elb.amazonaws.com"]
  },
  {
    name = "dev.rafiki-auth.walletguru.co"
    type = "CNAME"
    records = ["a19ddf081adf74c94978f8903bc54031-411375565.us-east-2.elb.amazonaws.com"]
  },
  {
    name = "dev.walletguru.me"
    type = "CNAME"
    records = ["a19ddf081adf74c94978f8903bc54031-411375565.us-east-2.elb.amazonaws.com"]
    zone_id_shared = "Z005616523M0XVD03LD0M"
  },
  {
    name = "dev.interaction.walletguru.co"
    type = "CNAME"
    records = ["a19ddf081adf74c94978f8903bc54031-411375565.us-east-2.elb.amazonaws.com"]
  },
  {
    name = "dev.mock.walletguru.co"
    type = "CNAME"
    records = ["a19ddf081adf74c94978f8903bc54031-411375565.us-east-2.elb.amazonaws.com"]
  },
  {
    name = "dev.websocket.walletguru.co"
    type = "CNAME"
    records = ["a19ddf081adf74c94978f8903bc54031-411375565.us-east-2.elb.amazonaws.com"]
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
      Environment = "dev"
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
      Environment = "dev"
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
      Environment = "dev"
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
      Environment = "dev"
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
      Environment = "dev"
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
      Environment = "dev"
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
      Environment = "dev"
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
      Environment = "dev"
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
      Environment = "dev"
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
      Environment = "dev"
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
      Environment = "dev"
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
      Environment = "dev"
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
      Environment = "dev"
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
      Environment = "dev"
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
      Environment = "dev"
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
      Environment = "dev"
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
      Environment = "dev"
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
      Environment = "dev"
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
      Environment = "dev"
    }
  },
]
name_queue = "paystreme-notifications-development"
s3_buckets = [
  {
    name = "walletguru-dev"
  }
]
create_domain                  = true
zone_id                        = "Z00522293EO3PH1CIDJ"
email_configuration_source_arn = "arn:aws:ses:us-east-2:975050359967:identity/walletguru.co"