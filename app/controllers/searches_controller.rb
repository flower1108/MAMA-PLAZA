class SearchesController < ApplicationController
  before_action :authenticate_any!

  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word]).order(created_at: :desc)
    else
      @posts = Post.looks(params[:search], params[:word]).order(created_at: :desc)
    end
  end
end
