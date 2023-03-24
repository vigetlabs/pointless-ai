class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    messages = session[:messages] || []
    render "home/index", locals: {messages: messages}
    # res = PointyBearClient.submit_prompt("Do you have any honey left?")
    # render :json => {"data": res}
  end
end
