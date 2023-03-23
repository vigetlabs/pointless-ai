class HomeController < ApplicationController
  def index
    messages = session[:messages] || []
    render "home/index", locals: {messages: messages}
    # PointyBearClient.submit_prompt("Hello!")
  end
end
