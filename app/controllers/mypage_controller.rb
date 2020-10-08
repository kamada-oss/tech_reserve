class MypageController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def comment_index
    @comments = @user.comments
    create_chart
  end

  def edit_profile
  end

  def update_profile
    if @user.update(user_params)
      sign_in(@user, bypass: true) if current_user.id == @user.id
      redirect_to comment_index_mypage_path, notice: 'プロフィールを更新しました'
    else
      if @user.password.empty? && @user.errors.exclude?(:image) &&
         @user.errors.exclude?(:nickname) && @user.errors.exclude?(:introduction) &&
         @user.errors.exclude?(:email)
        @user.save(validate: false)
        redirect_to comment_index_mypage_path, notice: 'プロフィールを更新しました'
      else
        render :edit_profile
      end
    end
  end

  def good_index
    comment_ids = []
    @user.goods.each do |good|
      comment_ids << good.comment_id
    end
    @comments = Comment.where(id: comment_ids).includes(:user, :categories)
  end

  def comments
    @comments = @user.comments.includes(:user, :categories)
  end

  def follows
    @users = @user.followings
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(
        :image,
        :nickname,
        :introduction,
        :email,
        :password,
        :password_confirmation
      )
    end

    def create_chart
      # コメントに対して、カテゴリと学習時間を取得
      chart_hi = []
      @comments.each do |comment|
        comment.categories.each do |category|
          chart_hi.push([category.name, comment.learning_time])
        end
      end
      # 重複レコードの学習時間を集計
      @chart = []
      flg = 0
      chart_hi.each do |chart_h|
        @chart.each do |chart|
          if chart[0] == chart_h[0]
            chart[1] += chart_h[1]
            flg = 1
          end
        end
        if flg == 0
          @chart << chart_h
        end
        flg = 0
      end
    end
end
