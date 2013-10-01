class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash.notice = "<p>Account '#{@user.name}' created</p>".html_safe
      flash.notice += "<p>Please <a href='#{login_path}'>sign in</a> to use your account</p>".html_safe
      redirect_to root_path
    else
      flash.now.alert = "Account wasn't created"
      render :new
    end
  end
end