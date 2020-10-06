class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      Event.create(title: "#{@comment.learning_time.to_s}分", body: @comment.learning_time.to_s, 
                   start_date: @comment.created_at, end_date: @comment.created_at, user_id: current_user.id)
      respond_to do |format|
        format.json
      end
    else
      render template: "home/top"
    end
  end

  def destroy; end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def comment_params
    params.require(:comment).permit(:text, :learning_time, category_ids: []).merge(user_id: current_user.id)
  end
end
