# this envs are example, you need change it for your own envs
aws_access_key        = "AKIAWNHTHA5..."
aws_secret_key        = "gA9AU6ax3jey..."
aws_region            = "us-east-2"
aws_account_id        = "440744216388"
aws_access_key_shared = "AKIAWNHTHA5..."
aws_secret_key_shared = "gA9AU6ax3jey..."
aws_region_shared     = "us-east-2"
public_key            = "ssh-rsa AAAAB3NzaC1yc"
namespaces = ["local"]
repos_list = ["backend-auth", "backend-notification", "frontend-admin", "backend-wallet","ws"]
microservices_list = [
  {
    name             = "backend-auth"
    namespace        = "local"
    image            = "975050359999.dkr.ecr.us-east-2.amazonaws.com/backend-auth:development-latest"
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
    namespace        = "local"
    image            = "975050359999.dkr.ecr.us-east-2.amazonaws.com/backend-notification:development-latest"
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
    namespace        = "local"
    image            = "975050359999.dkr.ecr.us-east-2.amazonaws.com/frontend-admin:development-latest"
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
    namespace        = "local"
    image            = "975050359999.dkr.ecr.us-east-2.amazonaws.com/backend-wallet:development-latest"
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
    namespace    = "local"
    service_name = "backend-auth"
    service_port = "3000"
    traefik_name = "auth"
  },
  {
    domain       = "dev.notification.walletguru.co"
    namespace    = "local"
    service_name = "backend-notification"
    service_port = "3000"
    traefik_name = "notification"
  },
  {
    domain       = "dev.admin.walletguru.co"
    namespace    = "local"
    service_name = "frontend-admin"
    service_port = "3000"
    traefik_name = "admin"
  },
  {
    domain       = "dev.wallet.walletguru.co"
    namespace    = "local"
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
    namespace    = "local"
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
      Environment = "local"
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
      Environment = "local"
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
      Environment = "local"
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
      Environment = "local"
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
      Environment = "local"
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
      Environment = "local"
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
      Environment = "local"
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
      Environment = "local"
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
      Environment = "local"
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
      Environment = "local"
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
      Environment = "local"
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
      Environment = "local"
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
      Environment = "local"
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
      Environment = "local"
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
      Environment = "local"
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
      Environment = "local"
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
      Environment = "local"
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
      Environment = "local"
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
      Environment = "local"
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
      Environment = "local"
    }
  },
]
name_queue = "paystreme-notifications-development"
s3_buckets = [
  {
    name = "walletguru-local"
  }
]
create_domain                  = false
zone_id                        = "Z00522293EO3PH1CIDJ"
email_configuration_source_arn = "arn:aws:ses:us-east-2:975050359999:identity/walletguru.co"