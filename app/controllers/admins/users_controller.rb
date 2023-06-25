class Admins::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.post.page(params[:page]).per(20)
  end

  def index
    @users = User.all.page(params[:page]).per(20)
  end

  #退会機能
  def unsubscribe
    @user = User.find(params[:id])
  end

  def withdraw
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    redirect_to admins_user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :child_information, :introduction, :profile_image)
  end

end
