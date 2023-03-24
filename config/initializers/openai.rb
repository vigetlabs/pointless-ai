require "openai"

OpenAI.configure do |config|
  # Follow the README under "Adding credentials" to add your own API key here
  config.access_token = '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'
  config.request_timeout = 10 # Optional
end
