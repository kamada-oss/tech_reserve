class CommentsController < ApplicationController
  before_action :set_category

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = 1
    if @comment.save
      respond_to do |format|
        format.html { redirect_to category_path(Category.first)}
        format.json
      end
    else
      redirect_to root_path
    end
  end

  def destroy
  end

  private
    def set_category
      @category = Category.find(params[:category_id])
    end
    def comment_params
      params.require(:comment).permit(:text, :learning_time, category_ids: [])
    end
end
