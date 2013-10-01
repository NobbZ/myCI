class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_name params[:name]
    if user && user.authenticate(params[:password])
      session[:current_user] = user.id
      flash.notice = "Welcome #{user.name}"
    end
  end
end
