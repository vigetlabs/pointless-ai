require "openai"

# OpenAI wrapper for a bear that loves honey
class PointyBearClient
  MODEL = "gpt-3.5-turbo".freeze

  class << self
    def submit_prompt(prompt)
      response = openai_client.chat(
        parameters: {
          model: MODEL,
          messages: [{role: "user", content: prompt}], # Required.
          temperature: 0.7
        }
      )
      puts response
    end

    private

    def openai_client
      @client ||= OpenAI::Client.new
    end
  end
end
