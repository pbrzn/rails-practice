class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if !@user || !@user.authenticate(password: params[:password])
      flash[:error] = "Try again."
    else
      session[:user_id = @user.id
      redirect_to user_path(@user)
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
