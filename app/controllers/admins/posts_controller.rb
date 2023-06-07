class Admin::PostsController < ApplicationController

  private
  def post_params
    params.require(:list).permit(:title, :body, :image)
  end
end
