class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @message = message_thread.messages.build(message_params)

    if @message.save?
    end

    message = params[:message]
    messages = session[:messages] || []

    # Append our message to the session
    session[:messages] = messages << message

    respond_to do |format|
      format.html { redirect_to "/" }
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

  def message_params
    params.require(:message).permit(:message)
  end

  def message_thread
    @message_thread ||= current_user.message_threads.first
  end
end
