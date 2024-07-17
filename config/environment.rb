# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Ensure the secret_key_base is set from credentials
Rails.application.credentials.secret_key_base