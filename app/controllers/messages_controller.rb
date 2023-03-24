class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    if !message_thread.at_limit?
      @message = message_thread.messages.build(content: params[:content])

      respond_to do |format|
        if @message.valid? && @message.save
          # PointyBearClient.submit_prompt(@message, message_thread.historical_message_contents)
          @message.update(assistant_reply: "This is a test reply from the assistant")

          format.turbo_stream
          format.html { redirect_to messages_url, notice: "Message was successfully created." }
        end
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(:messages_frame, partial: "messages/limit_reached")
        end

        format.html { redirect_to messages_url }
      end
    end
  end

  def reset
    # Reset our session and redirect to home
    session[:messages] = []
    respond_to do |format|
      format.html { redirect_to "/" }
    end
  end

  private

  def message_thread
    @message_thread ||= current_user.message_threads.first
  end
end
