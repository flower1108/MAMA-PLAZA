class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @user = User.find(params[:id])
    @posts = @user.post.page(params[:page]).per(20)
  end

  def index
    @users = User.all.page(params[:page]).per(20)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admins_user_path(@user)
  end



  private

  def user_params
    params.require(:user).permit(:name, :email, :child_information, :introduction, :profile_image, :is_deleted)
  end

end
