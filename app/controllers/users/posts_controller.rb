class Users::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to '/posts'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def living
    @posts = Post.all
  end

  def trip
    @posts = Post.all
  end

  def food
    @posts = Post.all
  end

  def talk
    @posts = Post.all
  end


  private
  def post_params
    params.require(:post).permit(:title, :body, :post_image, :category)
  end
end
