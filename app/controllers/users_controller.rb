class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update]

  def edit
    # redirect_to @article
    
    # @user = current_user
  end

  def update
    @user.update(user_params)
    flash[:success] = "User has been updated"
    redirect_to root_path
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :nome)
  end
end
