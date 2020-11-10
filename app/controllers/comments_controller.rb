class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:destroy :edit]

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      Event.create(title: "#{@comment.learning_time}分", body: @comment.learning_time.to_s,
                   start_date: @comment.created_at, end_date: @comment.created_at, user_id: current_user.id)
      respond_to do |format|
        format.json
      end
    else
      render template: "home/top"
    end
  end

  def destroy
    binding.pry
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :learning_time, category_ids: []).merge(user_id: current_user.id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
