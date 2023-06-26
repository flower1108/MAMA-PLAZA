class Admins::CommentsController < ApplicationController

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id]).destroy
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id, :user_id, :parent_id)
  end

end