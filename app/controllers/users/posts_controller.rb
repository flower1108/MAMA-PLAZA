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
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
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
    redirect_to new_post_path
  end

  def living
    @livings = Post.where(category:"living")
  end

  def trip
    @trips = Post.where(category:"trip")
  end

  def food
    @foods = Post.where(category:"food")
  end

  def talk
    @talks = Post.where(category:"talk")
  end


  private
  def post_params
    params.require(:post).permit(:title, :body, :post_image, :category)
  end
end
