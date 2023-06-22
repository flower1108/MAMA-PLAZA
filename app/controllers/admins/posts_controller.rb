class Admins::PostsController < ApplicationController

  def index
    @posts = Post.all.page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admins_posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :post_image, :category)
  end
end
