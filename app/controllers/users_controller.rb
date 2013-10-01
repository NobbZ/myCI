class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(params[:user])
    flash.notice = "Account '#{user.name}' created<br>".html_safe
    flash.notice += "Please <a href='#{login_path}'>sign in</a> to use your account".html_safe
    redirect_to root_path
  end
end