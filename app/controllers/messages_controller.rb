class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @message = message_thread.messages.build(content: params[:content])
    message_thread.generate_assistant_reply(@message)

    respond_to do |format|
      if @message.valid? && @message.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(:messages_frame, partial: "messages/message",
            locals: {message: @message})
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
