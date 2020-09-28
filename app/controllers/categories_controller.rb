class CategoriesController < ApplicationController
  before_action :set_category, only:[:show]
  before_action :set_categories
  def index
  end

  def show
    @comments = @category.comments.includes(:user)
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def set_categories
      @categories = Category.all
    end
end
