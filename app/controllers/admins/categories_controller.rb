class Admins::CategoriesController < ApplicationController
  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new
    @category.save
  end
end
