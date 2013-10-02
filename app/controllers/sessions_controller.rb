class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_name params[:name]
    if user && user.authenticate(params[:password])
      session[:current_user] = user.id
      flash.notice = "Welcome #{user.name}"
    else
      flash.alert = "Couldn't log in"
      render :new
    end
  end

  def destroy
    session[:current_user] = nil
    redirect_to root_path, notice: 'Logged out successfully'
  end
end
