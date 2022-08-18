class UsersController < ApplicationController
  # authenticate_user_before
  
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
