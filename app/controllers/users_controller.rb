class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
    @posts = @user.posts
  end

  def new
    @user = User.new
  end

  def create
    if @user.valid?
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @error_messages = @user.errors
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :bio)
  end

end
