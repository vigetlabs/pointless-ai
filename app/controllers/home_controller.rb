class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :check_message_thread, only: [:index]

  def index
  end

  private

  def message_thread
    @message_thread ||= current_user.message_threads.first
  end
  helper_method :message_thread

  def messages
    @messages ||= message_thread.messages
  end
  helper_method :messages

  def check_message_thread
    # for mvp, create a message thread for when the user lands
    if current_user.message_threads.empty?
      current_user.message_threads.create
    end
  end
end
