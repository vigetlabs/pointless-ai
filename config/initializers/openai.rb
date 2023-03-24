require "openai"

OpenAI.configure do |config|
  # Follow the README under "Adding credentials" to add your own API key here
  # config.access_token = Rails.application.credentials.openai.access_token
  config.access_token = "F"
  config.request_timeout = 10 # Optional
end
