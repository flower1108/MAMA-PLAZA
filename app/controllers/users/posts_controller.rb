class Users::PostsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :living, :trip, :food, :talk]


  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.post_image.present?
      tags = Vision.get_post_image_data(post_params[:post_image])
    end
    @post.user_id = current_user.id
    if @post.save
      if @post.post_image.present?
        tags.each do |tag|
          @post.tags.create(name: tag)
        end
      end
      flash[:notice] = "投稿に成功しました。"
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user == current_user
    else
      redirect_back
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿を更新しました。"
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user)
  end

  def living
    @livings = Post.where(category:"living").page(params[:page]).per(20)
  end

  def trip
    @trips = Post.where(category:"trip").page(params[:page]).per(20)
  end

  def food
    @foods = Post.where(category:"food").page(params[:page]).per(20)
  end

  def talk
    @talks = Post.where(category:"talk").page(params[:page]).per(20)
  end


  private

  def post_params
    params.require(:post).permit(:title, :body, :post_image, :category)
  end

  def is_matching_login_user
    post = Post.find(params[:id])
    unless current_user.id == post.user.id
      redirect_to posts_path
    end
  end
end
