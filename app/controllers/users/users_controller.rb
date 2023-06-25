class Users::UsersController < ApplicationController
  before_action :set_user, only: [:favorites, :followings, :followers]
  before_action :ensure_guest_user, only: [:edit]
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @users = User.all.page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.post.page(params[:page]).per(10)
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
    @favorite_post = Post.page(params[:page]).per(20)
  end

  #フォロー一覧
  def followings
    @users = @user.followings.page(params[:page]).per(20)
  end

  #フォローワー一覧
  def followers
    @users = @user.followers.page(params[:page]).per(20)
  end

  #退会機能
  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :child_information, :introduction, :profile_image)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.guest_user?
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end

end
