require "openai"

class OpenAiClient
  MODEL = "gpt-3.5-turbo".freeze

  def initialize(persona, message_thread)
    @persona = persona
    @message_thread = message_thread
  end

  def submit_prompt(message_thread)
    historical_messages = message_thread.historical_message_contents
    latest_message = message_thread.messages.last

    begin
      response = client.chat(
        parameters: {
          model: MODEL,
          messages: build_messages(latest_message, historical_messages),
          temperature: 0.7
        }
      )

      if response.code == 200
        params = {
          usage: response["usage"],
          assistant_reply: response["choices"][0]["message"]["content"]
        }

        latest_message.update(params)

        {success: params[:assistant_reply]}
      else
        {failure: "Aw, shucks! Something went wrong. It's entirely possible the WiFi at the Honey Factory is down."}
      end
    rescue OpenAI::ConfigurationError => e
      {failure: e.to_s}
    rescue OpenAI::Error => e
      {failure: e.to_s}
    end
  end

  private

  def client
    @client ||= OpenAI::Client.new
  end

  def build_messages(message, historical_messages)
    # System Role, injecting prompt
    messages = [{"role" => "system", "content" => @persona.prompt}]

    # Historical messages
    if historical_messages.present?
      messages << historical_messages
    end

    (messages << {role: "user", content: message.content}).flatten
  end
end
