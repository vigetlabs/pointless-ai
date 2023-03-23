require "openai"

# OpenAI wrapper for a bear that loves honey
class PointyBearClient
  MODEL = "gpt-3.5-turbo".freeze

  class << self
    def submit_prompt(user_submission)
      # TODO error handling
      # so far it timeouts, capped at 10s
      openai_client.chat(
        parameters: {
          model: MODEL,
          messages: [build_system_prompt_structure, {role: "user", content: user_submission}],
          temperature: 0.7
        }
      )
    end

    private

    def openai_client
      @client ||= OpenAI::Client.new
    end

    def character
      @ai_character ||= AiCharacter.where(name: "Pointy Bear").first
    end

    def build_system_prompt_structure
      {"role" => "system", "content" => character.prompt}
    end
  end
end
