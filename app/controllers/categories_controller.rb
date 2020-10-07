class CategoriesController < ApplicationController
  before_action :redirect_to_login_when_not_signed_in
  before_action :set_category, only: [:show]
  before_action :set_categories

  def index
    @comments = Comment.all.includes(:user, :categories)
    @comment = Comment.new
  end

  def show
    @comments = @category.comments.includes(:user, :categories)
    @comment = Comment.new
  end

  private

  def redirect_to_login_when_not_signed_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def set_categories
    @categories = Category.all
  end
end
