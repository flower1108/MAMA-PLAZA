class Admins::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.post
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :child_information, :introduction, :profile_image)
  end

end
