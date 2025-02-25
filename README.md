# Wallet guru - wallet management system

## Description

Wallet guru is a wallet management system that allows users to create wallets, deposit money, withdraw money, transfer
money to other wallets, and view their transaction history.

## requirements

- Terraform
- AWS account
- AWS CLI

## How to deploy resources to AWS

1. Clone the repository
2. Navigate to the root directory of the project
3. Create a new file called `local.tfvars` in the root directory of the project and add the following variables to the
   file:

```sh
# this envs are example, you need change it for your own envs
aws_access_key        = "AKIA6GB..."
aws_secret_key        = "GeAqIRagq9..."
aws_region            = "us-east-2"
aws_account_id        = "975050359999"
aws_access_key_shared = "AKIAQIJRSB2IJKGFXVAH"
aws_secret_key_shared = "LlIK4Pe1F52Q..."
aws_region_shared     = "us-east-2"
public_key            = "ssh-rsa AAAAB3NzaC1yc"
namespaces = ["dev"]
repos_list = ["backend-auth", "backend-notification", "frontend-admin", "backend-wallet","ws"]
microservices_list = [
  {
    name             = "backend-auth"
    namespace        = "dev"
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
    namespace        = "dev"
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
    namespace        = "dev"
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
    namespace        = "dev"
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
  {
    name             = "backend-ws"
    namespace        = "dev"
    image            = "975050359999.dkr.ecr.us-east-2.amazonaws.com/ws:development-latest"
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
email_configuration_source_arn = "arn:aws:ses:us-east-2:975050359999:identity/walletguru.co"
```

### Envs

| Name of env                    | Description                                                                                                              | Instrucction                                                                                                                                                                                                                                                                                                                                                             | Required | Default                                                                                                                                                                                                                                                                                                                                                                                                                                 |
|--------------------------------|--------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| aws_access_key                 | AWS Access Key                                                                                                           | Go to aws iam and create a new user with name **terraform** and set permission **AdministratorAccess**, in security credentials crea a new access key with Command Line Interface (CLI) option, now you have this env **Access key**                                                                                                                                     | Yes      | AKIA6GB...                                                                                                                                                                                                                                                                                                                                                                                                                              |
| aws_secret_key                 | AWS Secret Key                                                                                                           | Go to aws iam and create a new user with name **terraform** and set permission **AdministratorAccess**, in security credentials crea a new access key with Command Line Interface (CLI) option, now you have this env **Secret access key**                                                                                                                              | Yes      | GeAqIRagq9...                                                                                                                                                                                                                                                                                                                                                                                                                           |
| aws_region                     | AWS Region to deploy resources                                                                                           | Set region to deploy resources                                                                                                                                                                                                                                                                                                                                           | Yes      | us-east-2                                                                                                                                                                                                                                                                                                                                                                                                                               |
| aws_account_id                 | AWS Account ID                                                                                                           | Get account id in the next link https://us-east-1.console.aws.amazon.com/billing/home?region=us-east-2#/account                                                                                                                                                                                                                                                          | Yes      | 975050359999                                                                                                                                                                                                                                                                                                                                                                                                                            |
| aws_access_key_shared          | AWS Access Key its used only for access to secret manager, can use **aws_access_key** if you use the same account of aws | Go to aws iam and create a new user with name **terraform** and set permission **AdministratorAccess**, in security credentials crea a new access key with Command Line Interface (CLI) option, now you have this env **Access key**                                                                                                                                     | Yes      | AKIA6GB...                                                                                                                                                                                                                                                                                                                                                                                                                              |
| aws_secret_key_shared          | AWS Secret Key its used only for access to secret manager, can use **aws_secret_key** if you use the same account of aws | Go to aws iam and create a new user with name **terraform** and set permission **AdministratorAccess**, in security credentials crea a new access key with Command Line Interface (CLI) option, now you have this env **Secret access key**                                                                                                                              | Yes      | GeAqIRagq9...                                                                                                                                                                                                                                                                                                                                                                                                                           |
| aws_region_shared              | AWS Region to deploy secret manager                                                                                      | Set region to deploy resources                                                                                                                                                                                                                                                                                                                                           | Yes      | us-east-2                                                                                                                                                                                                                                                                                                                                                                                                                               |
| public_key                     | Public key for entry in any instance of ec2                                                                              | Paste your ssh public key                                                                                                                                                                                                                                                                                                                                                | Yes      | ssh-rsa AAAAB3NzaC1y                                                                                                                                                                                                                                                                                                                                                                                                                    |
| namespaces                     | List of namespace for create resources in kubernetes                                                                     | Set a list with nameserver for create in k8s                                                                                                                                                                                                                                                                                                                             | No       | ["local"]                                                                                                                                                                                                                                                                                                                                                                                                                               |
| repos_list                     | List of repositories create in ECR (elastic container registry)                                                          | Set a list with name of repositories for create in ECR                                                                                                                                                                                                                                                                                                                   | No       | ["backend-auth", "backend-notification", "frontend-admin", "backend-wallet","ws]                                                                                                                                                                                                                                                                                                                                                        |
| microservices_list             | List of objects for create deployment, pods and service in kubernetes                                                    | Set a list with object configuration of microservices used in kubernetes. The name is the name of the name of the resource in k8s, the namespace is the namespace used for deploy the resoources, the image is the image used for deploy pods, the port and node_port is the port when microservice run, replicas is the number of replicas of you used,                 | No       | ```[{name = "backend-auth"namespace= "dev"image= "975050359999.dkr.ecr.us-east-2.amazonaws.com/backend-auth:development-latest"port = 3000replicas = 1node_port= 3000type_port= "ClusterIP"commands = []commands_job = []"var_envs" = []"var_envs_job" = []apply_migrations = false},]```                                                                                                                                               |
| traefik_envs                   | List of subdomains used in your cluster                                                                                  | Set a list with object configuration of subdomains used in kubernetes, The domain is the subdomain used with your microservice, the namespace is the namespace used for deploy the resoource, service_name is the name of the service used for expose your microservice, the port is the port when microservice run, and traefik_name is the name used for this resource | No       | ```[{domain       = "dev.auth.walletguru.co" namespace    = "dev" service_name = "backend-auth" service_port = "3000" traefik_name = "auth"},```                                                                                                                                                                                                                                                                                        |
| records_list                   | List of records in Route53 service of aws                                                                                | Set a list with object configuration of records of subdomains in route53 service of aws, the name is the subdomain name, type is the type of subdomain, records is the list of values for redirect subdomain                                                                                                                                                             | No       | ```[ { name = "dev.admin.walletguru.co" type = "CNAME" records = ["a19ddf081adf74c94978f8903bc54031-411375565.us-east-2.elb.amazonaws.com"] }, ]```                                                                                                                                                                                                                                                                                     |
| dynamo_tables                  | List of tables created in DynamoDb service of aws                                                                        | Set a list with object configuration of tables in DynamoDb, name is the name of table, billing_mode is the type of billing of the table, read_capacity and write_capacity is the capacity of the table for read and write objects                                                                                                                                        | No       | ```[ { name                        = "Attempts" billing_mode                = "PROVISIONED" read_capacity               = 5 write_capacity              = 5 hash_key                    = "Id" range_key                   = "" deletion_protection_enabled = true, attributes = [   {     name = "Id"     type = "S"   } ], ttl = [], global_secondary_index = [], tags = {   Name        = "Attempts"   Environment = "dev" } }, ]``` |
| name_queue                     | Name of the queue used in SQS service of aws                                                                             | Set a name of SQS used for notification                                                                                                                                                                                                                                                                                                                                  | Yes      | paystreme-notifications-local                                                                                                                                                                                                                                                                                                                                                                                                           |
| s3_buckets                     | List of names of buclkets created for save files                                                                         | Set a list with names of s3 buckets                                                                                                                                                                                                                                                                                                                                      | Yes      | ```{ name = "walletguru-dev"}]```                                                                                                                                                                                                                                                                                                                                                                                                       |
| create_domain                  | Bool for create aws_route53_zone in route53 service                                                                      | Set true if you need create aws_route53_zone                                                                                                                                                                                                                                                                                                                             | Yes      | False                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| zone_id                        | Zone id of aws_route53_zone create                                                                                       | Set id of aws_route53_zone for send emails                                                                                                                                                                                                                                                                                                                               | Yes      | Z00522293EO3PH12345                                                                                                                                                                                                                                                                                                                                                                                                                     |
| email_configuration_source_arn | Id of ses for send emails                                                                                                | Set id of ses configuration for send emails                                                                                                                                                                                                                                                                                                                              | Yes      | arn:aws:ses:us-east-2:975050359999:identity/walletguru.co                                                                                                                                                                                                                                                                                                                                                                               |

Note: before run terraform commands, you need push of the image to ecr and create the secret in secret manager with
the name **walletguru-local** and the key **.env** with you use in the microservices.

4. Run the following commands:

```bash
terraform init
terraform plan
terraform apply
```

5. Uncomment modules ecr_credentials, traefik, traefik-ingress in main.tf and run the following commands:

```bash
terraform apply
```

6. After the resources are created, you can access the resources created in the AWS console and deploy microservices.