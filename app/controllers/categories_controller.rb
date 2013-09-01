class CategoriesController < ApplicationController
  before_action :require_admin
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice]= "You created a category!"
      redirect_to root_path
    else
      render :new
    end

  end



private

def category_params
  params.require(:category).permit(:name)
end

end

