class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
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
end
