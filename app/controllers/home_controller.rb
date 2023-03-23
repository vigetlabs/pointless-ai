class HomeController < ApplicationController
  def index
    messages = session[:messages] || []
    render "home/index", locals: {messages: messages}
    # res = PointyBearClient.submit_prompt("Do you have any honey left?")
    # render :json => {"data": res}
  end
end
