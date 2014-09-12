class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: :welcome

  def welcome
    if logged_in?
      redirect_to menu_path
    end
  end

  def menu
    @user = current_user
    render :menu
  end
end
