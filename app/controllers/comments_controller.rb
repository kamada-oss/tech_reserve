class CommentsController < ApplicationController
  before_action :set_category

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = 1
    if @comment.save
      respond_to do |format|
        format.json
      end
    else
      render template: "home/top"
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
