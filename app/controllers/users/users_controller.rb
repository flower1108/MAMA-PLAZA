class Users::UsersController < ApplicationController
  before_action :set_user, only: [:favorites, :followings, :followers]

  def show
    @user = User.find(params[:id])
    @posts = @user.post
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render "edit"
    end
  end

  def favorites
    @favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(@favorites)
  end

  #フォロー一覧
  def followings
    @users = @user.followings
  end

  #フォローワー一覧
  def followers
    @users = @user.followers
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :child_information, :introduction, :profile_image)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
