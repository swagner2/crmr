# Credentials Generator override
# This handles the shared credentials file
require "rails/generators"
require "rails/generators/rails/credentials/credentials_generator"

Rails::Generators::CredentialsGenerator.class_eval do
  def credentials_template
    Jumpstart::Credentials.template
  end
end

# Encrypted File Generator override
# This handles the environment credentials
require "rails/generators/rails/encrypted_file/encrypted_file_generator"

Rails::Generators::EncryptedFileGenerator.class_eval do
  private
    def encrypted_file_template
      Jumpstart::Credentials.template
    end
end

module Jumpstart
  module Credentials
    def self.template
      <<~YAML
        # Used as the base secret for all MessageVerifiers in Rails, including the one protecting cookies.
        secret_key_base: #{SecureRandom.hex(64)}

        # aws:
        #   access_key_id: 123
        #   secret_access_key: 345

        # Jumpstart config
        # ----------------
        # Here you can define global credentials which will be available for all environments.
        # You can override for an environment by nesting them under the environment keys
        # For example:
        #
        # stripe_key: 'xxx'
        # production:
        #   stripe_key: 'yyy'
        #
        # This will use 'yyy' in production, but 'xxx' in any other environment.

        # Used for encrypting OAuth access tokens
        access_token_encryption_key: '#{Base64.encode64(SecureRandom.random_bytes(32)).strip}'

        # Login Providers via OmniAuth
        # ---------------
        omniauth:
          # Add other OmniAuth providers here

          facebook:
            # https://developers.facebook.com/apps/
            public_key: ''
            private_key: ''

          google_oauth2:
            # https://code.google.com/apis/console/
            public_key: ''
            private_key: ''

          github:
            # https://github.com/settings/developers
            public_key: ''
            private_key: ''

          twitter:
            # https://apps.twitter.com
            public_key: ''
            private_key: ''

        # Mail Providers
        # --------------

        mailjet:
          # https://app.mailjet.com/account/setup
          username: ''
          password: ''
          domain: ''

        mailgun:
          # https://app.mailgun.com/app/sending/domains/<YOUR_MAILGUN_DOMAIN>/credentials
          username: ''
          password: ''

        mandrill:
          # https://mandrillapp.com/settings/index
          username: ''
          password: ''
          domain: ''

        postmark:
          # https://account.postmarkapp.com/servers -> Server -> Credentials
          username: ''
          password: ''

        sendgrid:
          # https://app.sendgrid.com/settings/api_keys
          username: 'apikey'
          password: ''
          domain: example.com

        sendinblue:
          # https://account.sendinblue.com/advanced/api
          username: ''
          password: ''

        ses:
          # https://console.aws.amazon.com/ses/home
          username: ''
          password: ''
          address: ''

        sparkpost:
          # https://app.sparkpost.com/account/api-keys
          username: 'SMTP_Injection'
          password: ''

        ### Payment Providers

        # Braintree Payments (Required for PayPal support)
        # https://braintreegateway.com
        # https://sandbox.braintreegateway.com
        # Webhooks should be pointed to https://domain.com/webhooks/braintree
        braintree:
          environment: ''
          public_key: ''
          private_key: ''
          merchant_id: ''

        # Stripe Payments
        # https://dashboard.stripe.com/account/apikeys
        stripe:
          public_key: ''
          private_key: ''

          # For processing Stripe webhooks
          # https://dashboard.stripe.com/account/webhooks
          # Webhooks should be pointed to https://domain.com/webhooks/stripe
          signing_secret: ''
      YAML
    end
  end
end
