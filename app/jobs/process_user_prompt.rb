class ProcessUserPrompt < ApplicationJob
  queue_as :default

  def perform(message_thread)
    puts "Processing user prompt..."

    persona = Persona.first  # temporary
    client = OpenAiClient.new(persona, message_thread)

    # response = client.submit_prompt(
    #   latest_message,
    #   message_thread.historical_message_contents
    # )
    response = client.submit_prompt(message_thread)

    if response.has_key?(:success)
      puts "Success!"
    else
      puts "Failure!"
    end

    puts response
  end
end
