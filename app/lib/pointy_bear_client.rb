require "openai"

# OpenAI wrapper for a bear that loves honey
class PointyBearClient
  MODEL = "gpt-3.5-turbo".freeze

  class << self
    def submit_prompt(message, historical_messages)
      # TODO error handling
      response = openai_client.chat(
        parameters: {
          model: MODEL,
          messages: build_messages(message, historical_messages),
          temperature: 0.7
        }
      )

      puts response

      message.update(assistant_reply: response["choices"][0]["message"]["content"])
    end

    private

    def openai_client
      @client ||= OpenAI::Client.new
    end

    def character
      @ai_character ||= AiCharacter.where(name: "Pointy").first
    end

    def build_system_prompt_structure
      {"role" => "system", "content" => character.prompt}
    end

    def build_messages(message, historical_messages)
      # [build_system_prompt_structure, historical_messages, {role: "user", content: message.content}]
      messages = [build_system_prompt_structure]

      if historical_messages.present?
        messages << historical_messages
      end

      (messages << {role: "user", content: message.content}).flatten
    end
  end
end
