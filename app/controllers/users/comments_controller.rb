class Users::CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash.now[:notice] = "コメントの投稿に成功しました"
      redirect_to post_path(@post)
    else
      flash.now[:notice] = "コメントの投稿に失敗しました"
      redirect_to post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment_reply = @post.comments.new
    Comment.find(params[:id]).destroy
    flash.now[:notice] = "コメントを削除しました"
    redirect_to post_path(params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id, :user_id, :parent_id)
  end

end
