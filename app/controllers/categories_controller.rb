class CategoriesController < ApplicationController
  
  def index
    @categories = Category.all
  end
  
  def destroy
    Category.find(params[:id]).destroy
    redirect_to categories_url
  end
  
  def new
    Category.new
  end
  
  def create
    @category = Category.create(params[:category])
    redirect_to categories_url
  end
  
end
