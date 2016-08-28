class UsersController < ApplicationController
  def index
    @users = current_user.family.user.all
  end

  def create
    @user = current_user.family.user.new(user_params)

    if @user.save
      redirect_to users_path
    else
      render "index"
    end
  end

  def destroy
    @user = current_user.family.user.find(params[:id])

    if @user.destroy
      redirect_to users_path
    else
      render "index"
    end
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :email)
  end
end
