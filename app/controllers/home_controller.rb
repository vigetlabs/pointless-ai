class HomeController < ApplicationController
  def index
    messages = session[:messages] || []
    render "home/index", locals: {messages: messages}
  end
end
