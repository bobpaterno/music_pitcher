class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:user][:username], params[:user][:password])
      redirect_to menu_path, notice: "Welcome back, #{@user.username}!"
    else
      @user = User.new(params.require(:user).permit(:username, :password))
      @user.valid?
      flash.now[:alert] = "We could not sign you in. Please check your sign in information below."
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_user_session_path
  end
end
