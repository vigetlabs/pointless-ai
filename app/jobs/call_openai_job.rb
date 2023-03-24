class CallOpenaiJob < ApplicationJob
  queue_as :default

  def perform(message_thread, message)
    PointyBearClient.submit_prompt(message, message_thread.historical_message_contents)
  end
end
