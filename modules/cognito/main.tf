resource "aws_cognito_user_pool" "user_pool" {
  name = var.name
  username_attributes = var.username_attributes
  deletion_protection = var.deletion_protection
  password_policy {
    minimum_length = 8
    require_lowercase = true
    require_numbers = true
    require_symbols = true
    require_uppercase = true
    temporary_password_validity_days = 7
  }
  verification_message_template {
    default_email_option = "CONFIRM_WITH_CODE"
    email_subject = "Verification Code to Update Your Password"
    email_message = "<!DOCTYPE html>  <html lang='en'>  <head>  <meta charset='UTF-8'>  <meta name='viewport' content='width=device-width, initial-scale=1.0'>  <title></title>  <style>        body {            font-family: Arial, sans-serif;            background-color: #f4f4f4;            margin: 0;            padding: 0;        }        .email-container {            margin: 0 auto;            background-color: #ffffff;            padding: 20px;        }        .header {            display: flex;            justify-content: center; /* Center content horizontally */            align-items: center; /* Center content vertically */            padding-bottom: 20px;        }        .header img {          width: 50px;          height: 50px;          margin-right: 10px;        }        .content {            padding: 20px;            text-align: left;        }        .content h1 {            color: #000000;        }        .content p {            color: #333333;            font-size: 16px;            line-height: 1.5;        }        .activation-code {            font-weight: bold;            color: #000000;        }        .footer {            text-align: left;            color: #999999;            font-size: 12px;            padding-top: 20px;            padding-left: 20px;        }  </style>  </head>  <body>  <div class='email-container'>  <div class='header'>  <img src='  https://walletguru-dev.s3.us-east-2.amazonaws.com/logo.png'  alt='Wallet Guru Logo'>  <h2>Wallet guru</h2>  </div>  <div class='content'>  <h1>Hi,</h1>  <p>We received a request to update the password for your account.</p>  <p>To proceed, please use the following verification code (OTP): <span class='activation-code'>{####}</span></p>  <br>  <p>This OTP is valid for the next 05:00 minutes.</p>  </div>  <div class='footer'>  <p>If you did not request this update, please disregard this email.</p>  <p>If you need further assistance, don't hesitate to contact us.</p>  <p>Best regards, <br> Wallet Guru Support Team</p>  </div>  </div>  </body>  </html>"
  }
  schema {
    attribute_data_type      = "String"
    mutable                  = true
    name                     = "email"
    required                 = true
    string_attribute_constraints {
      min_length = 1
      max_length = 256
    }
  }
  schema {
    attribute_data_type = "String"
    developer_only_attribute = false
    mutable                  = true
    name                     = "name"
    required                 = true

    string_attribute_constraints {
      min_length = 1
      max_length = 256
    }
  }
  email_configuration {
    email_sending_account = "DEVELOPER"
    from_email_address = "no-reply@walletguru.co"
    source_arn = var.email_configuration_source_arn
  }
}

resource "aws_cognito_user_pool_client" "client" {
  name = "cognito-client"
  user_pool_id = aws_cognito_user_pool.user_pool.id
  generate_secret = var.generate_secret
  refresh_token_validity = var.refresh_token_validity
  auth_session_validity = var.auth_session_validity
  access_token_validity = var.access_token_validity
  id_token_validity = var.id_token_validity
  prevent_user_existence_errors = "ENABLED"
  enable_token_revocation = true
  token_validity_units {
    access_token = "minutes"
    refresh_token = "days"
    id_token = "minutes"
  }
  explicit_auth_flows = [
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_USER_PASSWORD_AUTH",
    "ALLOW_ADMIN_USER_PASSWORD_AUTH",
    "ALLOW_USER_SRP_AUTH",
    "ALLOW_CUSTOM_AUTH",
  ]
}